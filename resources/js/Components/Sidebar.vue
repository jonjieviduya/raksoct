<script setup>
import { Link } from '@inertiajs/vue3';
</script>
<template>
	<ul class="w-48 flex flex-col border">
		<li>
			<Link
				class="w-full hover:bg-zinc-50 block px-4 py-2"
				:class="{ 'bg-zinc-100': route().current() == 'dashboard' }"
				:href="route('dashboard')"
			>Dashboard</Link>
		</li>
		<li>
			<Link
				class="w-full hover:bg-zinc-50 block border-t px-4 py-2"
				:class="{ 'bg-zinc-100': route().current().includes('users-management.') }"
				:href="route('users-management.index')"
			>User Management</Link>
		</li>
		<li>
			<Link
				class="w-full hover:bg-zinc-50 block border-t px-4 py-2"
				:class="{ 'bg-zinc-100': route().current().includes('tasks.') }"
				:href="route('tasks.index')"
			>Task Management</Link>
		</li>
	</ul>
</template>