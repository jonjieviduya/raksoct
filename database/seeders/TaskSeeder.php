<?php

namespace Database\Seeders;

use App\Models\Task;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TaskSeeder extends Seeder
{
    /**
     * Run the database seeds.
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
