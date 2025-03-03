<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm, Link } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';
import LinkButton from '@/Components/LinkButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import { ref } from 'vue';

const props = defineProps({
    tasks: {
        type: Object
    },
    statuses: {
        type: Array
    }
});

const paginationLinks = ref(props.tasks.meta.links);
const paginationLinkFirstPage = ref(props.tasks.meta.path + '?page=1');
const paginationLinkLastPage = ref(props.tasks.meta.path + '?page=' + props.tasks.meta.last_page);

const deleteTask = (task) => {
    const deleteForm = useForm({
        task_id: task.id
    });

    if (confirm('Are you sure you want to delete this task?')) {
        deleteForm.delete(route('tasks.destroy', task.id), {
            onSuccess: () => {
                alert('Task deleted!');
                window.location.reload();
            }
        });
    }
};

const archiveTask = (task) => {
    const archiveForm = useForm({
        task_id: task.id
    });

    if (confirm('Are you sure you want to archive this task?')) {
        archiveForm.patch(route('tasks.archives.update', task.id), {
            onSuccess: () => {
                alert('Task archived!');
                window.location.reload();
            }
        });
    }
};

const formFilter = useForm({
    status: new URLSearchParams(window.location.search).get('status') ?? 'All'
});

const applyFilter = () => {
    formFilter.get(route('tasks.index'));
};
</script>

<template>
    <Head title="Tasks" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between">
                <h2
                    class="text-xl font-semibold leading-tight text-gray-800"
                >
                    Task Management - All Tasks
                </h2>
                <div class="flex gap-2">
                    <LinkButton :href="route('tasks.archives')">Archives</LinkButton>
                    <LinkButton :href="route('tasks.create')">+ New Task</LinkButton>
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
                                
                                <div v-if="props.tasks.data.length > 0" class="flex gap-2 justify-between items-center mb-5">
                                    <div>
                                        <InputLabel>Status Filter</InputLabel>
                                        <select
                                            class="rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                            v-model="formFilter.status"
                                        >
                                            <option>All</option>
                                            <option
                                                v-for="(status, index) in props.statuses"
                                                :value="status"
                                                :key="index"
                                                :selected="status == formFilter.status"
                                            >
                                                {{ status }}
                                            </option>
                                        </select>
                                    </div>
                                    <div>
                                        <PrimaryButton @click="applyFilter">Apply Filter</PrimaryButton>
                                    </div>
                                </div>
                                
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
                                                <Link class="text-indigo-700 hover:underline" :href="route('tasks.show', task)">
                                                    {{ task.title }}
                                                </Link>
                                            </td>
                                            <td class="p-2 text-left border" :title="task.description">
                                                {{ task.short_description }}
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
                                                    <LinkButton :href="route('tasks.edit', task.id)">Edit</LinkButton>
                                                    <SecondaryButton @click="archiveTask(task)">Archive</SecondaryButton>
                                                    <SecondaryButton
                                                        @click="deleteTask(task)"
                                                        class="bg-rose-500 hover:bg-rose-600 border-rose-600 text-zinc-100"
                                                    >Delete</SecondaryButton>
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

                                <div class="flex mt-5">
                                    <Link class="py-2 px-4 rounded-l hover:bg-zinc-800 bg-zinc-700 text-white" :href="paginationLinkFirstPage" preserve-scroll>&laquo;</Link>
                                    <template v-for="page in paginationLinks">
                                        <Link :class="{'bg-zinc-900': page.active}" v-if="page.label.includes('Previous')" class="py-2 px-4 hover:bg-zinc-800 bg-zinc-700 text-white" :href="page.url ?? ''" preserve-scroll>&lsaquo;</Link>
                                        <Link :class="{'bg-zinc-900': page.active}" v-else-if="page.label.includes('Next')" class="py-2 px-4 hover:bg-zinc-800 bg-zinc-700 text-white" :href="page.url ?? ''" preserve-scroll>&rsaquo;</Link>
                                        <span :class="{'bg-zinc-900': page.active}" v-else-if="page.label.includes('...')" class="py-2 px-4 cursor-not-allowed bg-zinc-700 text-white">...</span>
                                        <Link :class="{'bg-zinc-900': page.active}" v-else class="py-2 px-4 hover:bg-zinc-800 bg-zinc-700 text-white" :href="page.url ?? ''" preserve-scroll>{{ page.label }}</Link>
                                    </template>
                                    <Link class="py-2 px-4 rounded-r hover:bg-zinc-800 bg-zinc-700 text-white" :href="paginationLinkLastPage" preserve-scroll>&raquo;</Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
