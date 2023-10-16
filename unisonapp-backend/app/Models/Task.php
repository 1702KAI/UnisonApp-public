<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    protected $fillable = ['description', 'dueDate', 'taskType'];

    // Define a relationship if necessary, for example, with a User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
