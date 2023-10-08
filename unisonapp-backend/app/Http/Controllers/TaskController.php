<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task; // Import the Task model

class TaskController extends Controller
{
    // Retrieve a list of tasks
    public function index()
    {
        $tasks = Task::all();
        return response()->json($tasks);
    }

    // Create a new task
    public function store(Request $request)
    {
        $request->validate([
            'description' => 'required|string',
            'dueDate' => 'required|date',
            'taskType' => 'required|string',
        ]);

        $task = new Task([
            'description' => $request->input('description'),
            'dueDate' => $request->input('dueDate'),
            'taskType' => $request->input('taskType'),
        ]);

        $task->save();

        return response()->json($task, 201);
    }

    // Update an existing task
    public function update(Request $request, $id)
    {
        $task = Task::find($id);

        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }

        $request->validate([
            'description' => 'string',
            'dueDate' => 'date',
            'taskType' => 'string',
        ]);

        $task->fill($request->all());
        $task->save();

        return response()->json($task);
    }

    // Retrieve details of a specific task
    public function show($id)
    {
        $task = Task::find($id);

        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }

        return response()->json($task);
    }

    // Delete a task
    public function destroy($id)
    {
        $task = Task::find($id);

        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }

        $task->delete();

        return response()->json(['message' => 'Task deleted'], 200);
    }
}
