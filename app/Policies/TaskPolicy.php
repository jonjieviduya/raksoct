<?php

namespace App\Policies;

use App\Models\Task;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class TaskPolicy
{
    public function update(User $user, Task $task): bool
    {
        return $user->id == $task->created_by || $user->hasRole('admin');
    }

    public function delete(User $user, Task $task): bool
    {
        return $user->id == $task->created_by || $user->hasRole('admin');
    }
}
