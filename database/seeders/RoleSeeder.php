<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('roles')->insert([
            'name' => 'admin',
            'label' => 'Admin'
        ]);
        
        DB::table('roles')->insert([
            'name' => 'manager',
            'label' => 'Manager'
        ]);

        DB::table('roles')->insert([
            'name' => 'user',
            'label' => 'User'
        ]);
    }
}
