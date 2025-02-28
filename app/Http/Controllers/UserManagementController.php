<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Inertia\Inertia;
use App\Models\User;
use Illuminate\Http\Request;

class UserManagementController extends Controller
{
    public function index()
    {
        $users = User::with(['roles'])->paginate(10);

        return Inertia::render('UserManagement/Index', compact('users'));
    }

    public function edit(User $user)
    {
        $roles = Role::all();

        $user->load('roles');

        $userRoleIds = $user->roles->pluck('id')->toArray();

        return Inertia::render('UserManagement/Edit', compact('user', 'roles', 'userRoleIds'));
    }

    public function update(User $user)
    {
        $user->roles()->sync(request('role_ids'));

        return to_route('users-management.edit', $user);
    }
}
