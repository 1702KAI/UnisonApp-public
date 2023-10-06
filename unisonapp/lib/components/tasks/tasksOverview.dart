import 'package:flutter/material.dart';

import '../../data_classes/tasks_data.dart';

class TasksOverview extends StatefulWidget {
  const TasksOverview({Key? key}) : super(key: key);

  @override
  State<TasksOverview> createState() => _TasksOverviewState();
}

class _TasksOverviewState extends State<TasksOverview> {
final List<Task> tasks = [
  Task(
    description: 'Task 1',
    dueDate: DateTime(2023, 10, 15),
    taskType: 'High ',
  ),
  Task(
    description: 'Task 2',
    dueDate: DateTime(2023, 10, 20),
    taskType: 'Medium',
  ),
  Task(
    description: 'Task 3',
    dueDate: DateTime(2023, 11, 5),
    taskType: 'Urgent',
  ),
  Task(
    description: 'Task 4',
    dueDate: DateTime(2023, 11, 12),
    taskType: 'Low',
  ),
  // Add more tasks here
];
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: Column(
      children: [
        Container(
          child: Column(
              children: [
                // const Text('You are all caught up'), 
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
                        DataCell(Text('${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}')),
                        DataCell(Text(task.taskType)),
                      ],
                    );
                  }).toList(),
                ),
                ]),
        ),
      ],
    ));
  }
}
