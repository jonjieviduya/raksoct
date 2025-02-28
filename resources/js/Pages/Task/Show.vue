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
    }
});

const commentForm = useForm({
    body: '',
    task_id: props.task.data.id
});

const addComment = () => {
    commentForm.post(route('comments.store'), {
        onSuccess: () => {
            alert('Comment added!');
            commentForm.reset();
        }
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
                    Task Management
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
                                <p class="text-5xl mb-8">{{ props.task.data.title }}</p>
                                <p class="mb-8">{{ props.task.data.description }}</p>

                                <h3 class="text-lg mb-3">Comments</h3>
                                
                                <div class="mb-3">
                                    <Textarea class="w-full" v-model="commentForm.body" rows="4" />
                                </div>
                                <div class="mb-5">
                                    <PrimaryButton @click="addComment">Add Comment</PrimaryButton>
                                </div>

                                <div class="border-t border-dashed pt-4">
                                    <div class="space-y-2" v-if="props.task.data.comments.length > 0">
                                        <div
                                            class="p-4 border rounded-md"
                                            v-for="comment in props.task.data.comments"
                                            :key="comment.id"
                                        >
                                            <p class="text-zinc-700">{{ comment.body }}</p>
                                            <p class="text-xs text-zinc-600">{{ comment.user.name }} • {{ comment.readable_created_at }}</p>
                                        </div>
                                    </div>
                                    <div v-else>
                                        <p class="w-full text-zinc-700 text-sm">No comments yet.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
