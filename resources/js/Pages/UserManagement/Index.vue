<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';
import LinkButton from '@/Components/LinkButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

const props = defineProps({
    users: {
        type: Object
    }
});
</script>

<template>
    <Head title="User Management" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between">
                <h2
                    class="text-xl font-semibold leading-tight text-gray-800"
                >
                    User Management - All User
                </h2>
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
                                            <th class="p-2 text-left border">Name</th>
                                            <th class="p-2 text-left border">Email</th>
                                            <th class="p-2 text-left border">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="props.users.data.length > 0">
                                        <tr v-for="user in props.users.data" :key="user.id">
                                            <td class="p-2 text-left border">
                                                {{ user.name }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                {{ user.email }}
                                            </td>
                                            <td class="p-2 text-left border">
                                                <div class="flex gap-1">
                                                    <LinkButton :href="route('users-management.edit', user.id)">Edit</LinkButton>
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
