import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_classes/tasks_data.dart';
import '../../providers/dio_provider.dart';

class TasksOverview extends StatefulWidget {
  const TasksOverview({Key? key}) : super(key: key);

  @override
  State<TasksOverview> createState() => _TasksOverviewState();
}

class _TasksOverviewState extends State<TasksOverview> {
  late TaskDataProvider taskDataProvider;

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

      // Use the provider to set the fetched tasks
      taskDataProvider.setTasks(fetchedTaskList);
    }
  }

  @override
  void initState() {
    super.initState();
      taskDataProvider = Provider.of<TaskDataProvider>(context, listen: false);
    _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    final taskDataProvider = Provider.of<TaskDataProvider>(context); // Access the provider
    final tasks = taskDataProvider.tasks; // Get the list of tasks from the provider

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                DataTable(
                  dividerThickness: 0,
                  columns: const [
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Due Date')),
                    DataColumn(label: Text('Priority')),
                  ],
                  rows: tasks.map((task) {
                    return DataRow(
                      cells: [
                        DataCell(Text(task.description)),
                        DataCell(Text(
                            '${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}')),
                        DataCell(Text(task.taskType)),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
