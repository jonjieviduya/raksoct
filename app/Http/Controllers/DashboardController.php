<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $tasksCreated = auth()->user()->tasksCreated()->count();
        $tasksAssigned = auth()->user()->tasks()->count();
        $tasksCompleted = auth()->user()->tasks()->where('status', 'done')->count();

        return Inertia::render('Dashboard', compact('tasksCreated', 'tasksAssigned', 'tasksCompleted'));
    }
}
