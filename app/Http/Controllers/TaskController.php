<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use App\Http\Requests\StoreTaskRequest;
use App\Http\Requests\UpdateTaskRequest;
use App\Http\Resources\TaskResource;
use App\Models\Task;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Gate;
use Inertia\Inertia;

class TaskController extends Controller
{
    public function index()
    {
        $tasks = Task::query();
        
        if(request()->has('status') && request('status') != 'All') {
            $tasks = $tasks->where('status', request('status'));
        }
        
        $tasks = $tasks->where('assigned_to', auth()->id())
            ->whereNull('archived_at')
            ->latest('id')
            ->paginate(10)
            ->withQueryString();

        $tasks = TaskResource::collection($tasks);

        $statuses = Task::statuses();

        return Inertia::render('Task/Index', compact('tasks', 'statuses'));
    }

    public function show(Task $task)
    {
        $task->load(['comments' => function ($query) {
            $query->orderBy('id', 'DESC');
        }, 'comments.user']);
        
        $task = TaskResource::make($task);

        return Inertia::render('Task/Show', compact('task'));
    }

    public function create()
    {
        $statuses = Task::statuses();
        $priorityLevels = Task::priorityLevels();

        return Inertia::render('Task/Create', compact('statuses', 'priorityLevels'));
    }

    public function store(StoreTaskRequest $request)
    {
        $payload = $request->validated();   
        $payload['created_by'] = auth()->id();
        $payload['assigned_to'] = auth()->id();
        
        $task = Task::create(collect($payload)->except(['files'])->toArray());

        if (request()->hasFile('files')) {
            foreach (request()->file('files') as $file) {
                File::ensureDirectoryExists('tasks/uploads');

                $fileName = Str::random(10) . '_'. time() . '.' . $file->getClientOriginalExtension();
                $file->storeAs('tasks/uploads/' . $fileName);

                $task->files()->create(['path' => $fileName]);
            }
        }

        return to_route('tasks.index');
    }

    public function edit(Task $task)
    {
        $statuses = Task::statuses();
        $priorityLevels = Task::priorityLevels();

        return Inertia::render('Task/Edit', compact('task', 'statuses', 'priorityLevels'));
    }

    public function update(Task $task, UpdateTaskRequest $request)
    {
        Gate::authorize('update', $task);

        $payload = $request->validated();

        $task->update($payload);

        return back();
    }

    public function destroy(Task $task)
    {
        Gate::authorize('delete', $task);

        $task->delete();

        return to_route('tasks.index');
    }

    public function archives()
    {
        $tasks = Task::where('assigned_to', auth()->id())
            ->whereNotNull('archived_at')
            ->latest('id')
            ->paginate(10);

        return Inertia::render('Task/Archives/Index', compact('tasks'));
    }

    public function archive(Task $task)
    {
        $task->update(['archived_at' => Carbon::now()]);

        return to_route('tasks.index');
    }

    public function unarchive(Task $task)
    {
        $task->update(['archived_at' => null]);

        return to_route('tasks.archives');
    }
}
