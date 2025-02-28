<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Task>
 */
class TaskFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $statuses = ['todo', 'in-progress', 'done'];
        $priorityLevel = ['high', 'medium', 'low'];

        return [
            'created_by' => User::factory(),
            'assigned_to' => User::factory(),
            'title' => fake()->words(3, true),
            'description' => fake()->realText(500),
            'status' => $statuses[array_rand($statuses)],
            'priority_level' => $priorityLevel[array_rand($priorityLevel)],
            'due_date' => fake()->dateTimeBetween('now', '+1 year', 'Asia/Manila')->format('Y-m-d')
        ];
    }
}
