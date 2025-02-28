<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import Sidebar from '@/Components/Sidebar.vue';
import LinkButton from '@/Components/LinkButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import Checkbox from '@/Components/Checkbox.vue';
import { ref } from 'vue';

const props = defineProps({
    user: {
        type: Object
    },
    roles: {
        type: Array
    },
    userRoleIds: {
        type: Array
    }
});

const selectedRoles = ref(props.userRoleIds);

const toggleRole = (value, selectedRoleId) => {
    if (value == false) {
        selectedRoles.value = selectedRoles.value.filter(roleId => roleId != selectedRoleId);
    } else {
        selectedRoles.value = [...selectedRoles.value, selectedRoleId];
    }
};

const saveChanges = () => {
    const form = useForm({
        role_ids: selectedRoles.value
    });

    form.patch(route('users-management.update', props.user.id), {
        onSuccess: () => {
            alert('User updated!')
        }
    });
};
</script>

<template>
    <Head title="User Management" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between">
                <h2
                    class="text-xl font-semibold leading-tight text-gray-800"
                >
                    User Management - Edit
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
                                <div class="mb-5">
                                    <h3 class="text-lg font-bold mb-1">User</h3>
                                    <p>{{ user.name }}</p>
                                </div>
                                <div class="mb-5">
                                    <h3 class="text-lg font-bold mb-1">Roles</h3>
                                    <ul v-if="props.roles.length > 0">
                                        <li v-for="role in props.roles" :key="role.id">
                                            <label>
                                                <Checkbox
                                                    :value="role.id"
                                                    :checked="props.userRoleIds.includes(role.id)"
                                                    @update:checked="toggleRole($event, role.id)"
                                                /> {{ role.label }}
                                            </label>
                                        </li>
                                        <!-- <p class="text-rose-400 mt-1 text-sm" v-if="form.errors.title">{{ form.errors.title }}</p> -->
                                    </ul>
                                </div>
                                <div>
                                    <PrimaryButton @click="saveChanges">Save Changes</PrimaryButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
