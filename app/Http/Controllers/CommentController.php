<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCommentRequest;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(StoreCommentRequest $request)
    {
        $payload = $request->validated();

        Comment::create([
            'task_id' => $payload['task_id'],
            'user_id' => auth()->id(),
            'body' => $payload['body']
        ]);
    }
}
