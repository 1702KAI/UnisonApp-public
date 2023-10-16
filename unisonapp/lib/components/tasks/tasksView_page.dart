import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unisonapp/utils/config.dart';
import '../../data_classes/tasks_data.dart';
import '../../providers/dio_provider.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late TaskDataProvider taskDataProvider;

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token != null) {
      final List<dynamic> fetchedTasks = await DioProvider().getTasks(token);

      // Convert the fetched data to a list of TaskData objects
      List<TaskData> fetchedTaskList = fetchedTasks.map((task) {
        return TaskData(
          description: task['description'],
          dueDate: DateTime.parse(task['dueDate']),
          taskType: task['taskType'],
        );
      }).toList();

      setState(() {
        tasks = fetchedTaskList;
      });
    }
  }

  List<TaskData> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.paintColor,
        title: Text(
          'Task List',
          style: const TextStyle(color: Config.secondaryColor),
        ),
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

void _addTask() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  if (token != null) {
    final TaskData newTask = TaskData(
      description: 'New Task',
      dueDate: DateTime.now().add(Duration(days: 1)),
      taskType: 'New Type',
    );

    final dynamic response = await DioProvider().createTask(token, 8, newTask);

    if (response != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }
}


  void _editTask(int index) {
    // You can implement logic to edit an existing task here
    setState(() {
      tasks[index] = TaskData(
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
