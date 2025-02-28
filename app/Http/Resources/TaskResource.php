<?php

namespace App\Http\Resources;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TaskResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
          'id' => $this->id,
          'comments' => $this->whenLoaded('comments', fn () => CommentResource::collection($this->comments)),
          'created_by' => $this->created_by,
          'assigned_to' => $this->assigned_to,
          'title' => Str::title($this->title),
          'description' => $this->description,
          'short_description' => Str::limit($this->description, 10),
          'status' => $this->status,
          'priority_level' => $this->priority_level,
          'due_date' => $this->due_date,
          'archived_at' => $this->archived_at
        ];
    }
}
