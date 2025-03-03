<?php

use App\Http\Controllers\CommentController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\UserManagementController;
use App\Http\Middleware\RoleMiddleware;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', [DashboardController::class, 'index'])
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::middleware([RoleMiddleware::class . ':admin'])->group(function () {
        Route::get('users-management', [UserManagementController::class, 'index'])->name('users-management.index');
        Route::get('users-management/{user}/edit', [UserManagementController::class, 'edit'])->name('users-management.edit');
        Route::patch('users-management/{user}', [UserManagementController::class, 'update'])->name('users-management.update');
    });

    Route::resource('tasks', TaskController::class);
    Route::get('tasks-archives', [TaskController::class, 'archives'])->name('tasks.archives');
    Route::patch('tasks-archives/{task}', [TaskController::class, 'archive'])->name('tasks.archives.update');
    Route::patch('tasks-unarchives/{task}', [TaskController::class, 'unarchive'])->name('tasks.unarchives');

    Route::resource('comments', CommentController::class)->only(['store']);
});

require __DIR__.'/auth.php';
