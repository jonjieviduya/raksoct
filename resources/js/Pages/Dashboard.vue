<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';

const props = defineProps({
    tasksCreated: {
        type: Number,
        required: true
    },
    tasksAssigned: {
        type: Number,
        required: true
    },
    tasksCompleted: {
        type: Number,
        required: true
    }
});
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2
                class="text-xl font-semibold leading-tight text-gray-800"
            >
                Dashboard
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div
                    class="overflow-hidden bg-white shadow-sm sm:rounded-lg"
                >
                    <div class="p-6 text-gray-900">
                        <div class="flex gap-4">
                            <div>
                                <Sidebar />
                            </div>
                            <div class="flex-grow flex gap-4">
                                <div class="w-full flex flex-col justify-between border p-4 text-center">
                                    <p class="text-3xl">{{ props.tasksCreated }}</p>
                                    <p class="text-sm">Tasks Created</p>
                                </div>
                                <div class="w-full flex flex-col justify-between border p-4 text-center">
                                    <p class="text-3xl">{{ props.tasksAssigned }}</p>
                                    <p class="text-sm">Tasks Assigned</p>
                                </div>
                                <div class="w-full flex flex-col justify-between border p-4 text-center">
                                    <p class="text-3xl">{{ props.tasksCompleted }}</p>
                                    <p class="text-sm">Tasks Completed</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
