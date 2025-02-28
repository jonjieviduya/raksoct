<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    /** @use HasFactory<\Database\Factories\TaskFactory> */
    use HasFactory;

    protected $guarded = [];

    public function userAssigned()
    {
        return $this->belongsTo(User::class, 'assigned_to');
    }

    public function files()
    {
        return $this->hasMany(TaskFile::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public static function statuses(): Array
    {
        return ['todo', 'in-progress', 'done'];
    }

    public static function priorityLevels(): Array
    {
        return ['high', 'medium', 'low'];
    }
}
