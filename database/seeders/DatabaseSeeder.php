<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Task;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        Task::factory()->count(3)->create(['created_by' => 1]);
        Task::factory()->count(5)->create(['assigned_to' => 1]);
        Task::factory()->count(10)->create([
            'created_by' => 1,
            'assigned_to' => 1
        ]);
    }
}
