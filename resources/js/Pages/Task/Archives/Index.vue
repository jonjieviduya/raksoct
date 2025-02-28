<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';
import LinkButton from '@/Components/LinkButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';

const props = defineProps({
    tasks: {
        type: Object
    }
});

const unarchive = (task) => {
    const unarchive = useForm({
        task_id: task.id
    });

    if (confirm('Are you sure you want to UNARCHIVE this task?')) {
        unarchive.patch(route('tasks.unarchives', task.id), {
            onSuccess: () => {
                alert('Task unarchived!');
                window.location.reload();
            }
        });
    }
};
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between">
                <h2
                    class="text-xl font-semibold leading-tight text-gray-800"
                >
                    Task Management - Archives
                </h2>
                <div class="flex gap-2">
                    <LinkButton :href="route('tasks.index')">All Tasks</LinkButton>
                </div>
            </div>
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
                            <div class="flex-grow">
                                <table class="border w-full">
                                    <thead>
                                        <tr>
                                            <th class="p-2 text-left border">Title</th>
                                            <th class="p-2 text-left border">Description</th>
                                            <th class="p-2 text-left border">Status</th>
                                            <th class="p-2 text-left border">Priority Level</th>
                                            <th class="p-2 text-left border">Due Date</th>
                                            <th class="p-2 text-left border">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="props.tasks.data.length > 0">
                                        <tr v-for="task in props.tasks.data" :key="task.id">
                                            <td class="p-2 text-left border">
                                                {{ task.title }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                {{ task.description }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                {{ task.status }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                {{ task.priority_level }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                {{ task.due_date }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                <div class="flex gap-1">
                                                    <SecondaryButton @click="unarchive(task)">Unarchive</SecondaryButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tbody v-else>
                                        <tr>
                                            <td class="p-2 text-left border text-zinc-600" colspan="5">No tasks assigned yet.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
