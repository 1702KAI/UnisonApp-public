
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unisonapp/utils/config.dart';

import '../../data_classes/tasks_data.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task(
      description: 'Task 1',
      dueDate: DateTime.now().add(Duration(days: 1)),
      taskType: 'Type A',
    ),
    Task(
      description: 'Task 2',
      dueDate: DateTime.now().add(Duration(days: 2)),
      taskType: 'Type B',
    ),
    Task(
      description: 'Task 3',
      dueDate: DateTime.now().add(Duration(days: 3)),
      taskType: 'Type C',
    ),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.paintColor,
        title: Text('Task List',style: const TextStyle(
          color: Config.secondaryColor
        ),),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.description),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Due Date: ${task.dueDate.toString()}'),
                Text('Type: ${task.taskType}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit button tap for this task
                    _editTask(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Handle delete button tap for this task
                    _deleteTask(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add task button tap
          _addTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    // You can implement logic to add a new task here
    setState(() {
      tasks.add(Task(
        description: 'New Task',
        dueDate: DateTime.now().add(Duration(days: 1)),
        taskType: 'New Type',
      ));
    });
  }

  void _editTask(int index) {
    // You can implement logic to edit an existing task here
    setState(() {
      tasks[index] = Task(
        description: 'Edited Task',
        dueDate: DateTime.now().add(Duration(days: 1)),
        taskType: 'Edited Type',
      );
    });
  }

  void _deleteTask(int index) {
    // You can implement logic to delete an existing task here
    setState(() {
      tasks.removeAt(index);
    });
  }
}