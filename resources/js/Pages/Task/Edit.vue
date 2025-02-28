<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import Textarea from '@/Components/Textarea.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import LinkButton from '@/Components/LinkButton.vue';

const props = defineProps({
    task: {
        type: Object
    },
    statuses: {
        type: Array
    },
    priorityLevels: {
        type: Array
    }
});

const form = useForm({
    title: props.task.title,
    description: props.task.description,
    status: props.task.status,
    priority_level: props.task.priority_level,
    due_date: props.task.due_date ?? ''
});

const updateTask = () => {
    form.patch(route('tasks.update', props.task.id), {
        preserveState: 'errors',
        onSuccess: () => alert('Task updated!')
    });
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
                    Task Management - Edit
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
                                <div>
                                    <InputLabel>Title</InputLabel>
                                    <TextInput class="w-full" v-model="form.title" />
                                    <p class="text-rose-400 mt-1 text-sm" v-if="form.errors.title">{{ form.errors.title }}</p>
                                </div>
                                <div class="mt-3">
                                    <InputLabel>Description</InputLabel>
                                    <Textarea class="w-full" v-model="form.description" rows="4" />
                                    <p class="text-rose-400 mt-1 text-sm" v-if="form.errors.description">{{ form.errors.description }}</p>
                                </div>
                                <div class="mt-3">
                                    <InputLabel>Priority Level</InputLabel>
                                    <select
                                        class="w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                        v-model="form.priority_level"
                                    >
                                        <option
                                            v-for="(priorityLevel, index) in props.priorityLevels"
                                            :value="priorityLevel"
                                            :key="index"
                                            :selected="priorityLevel == form.priority_level"
                                        >
                                            {{ priorityLevel }}
                                        </option>
                                    </select>
                                    <p class="text-rose-400 mt-1 text-sm" v-if="form.errors.priority_level">{{ form.errors.priority_level }}</p>
                                </div>
                                <div class="mt-3">
                                    <InputLabel>Due Date</InputLabel>
                                    <TextInput type="date" class="w-full" v-model="form.due_date" />
                                    <p class="text-rose-400 mt-1 text-sm" v-if="form.errors.due_date">{{ form.errors.due_date }}</p>
                                </div>
                                <div class="mt-5">
                                    <PrimaryButton @click="updateTask">Create</PrimaryButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
