import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unisonapp/providers/dio_provider.dart'; // Import your DioProvider class.
import 'package:unisonapp/data_classes/tasks_data.dart'; // Import your TaskData class.
import 'package:intl/intl.dart';

class CreateTasks extends StatefulWidget {
  const CreateTasks({Key? key}) : super(key: key);

  @override
  _CreateTasksState createState() => _CreateTasksState();
}

class _CreateTasksState extends State<CreateTasks> {
  // Create TextEditingController for the title and description fields
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Top row with back button and heading
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  'New Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add spacing

            // Title input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _priorityController, // Bind the controller
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add spacing

            // Description input field
            Container(
              height: 400, // Adjust the height as needed
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _descriptionController, // Bind the controller
                maxLines: null, // Allows the input field to expand vertically
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            TextButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDueDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null && selectedDate != _selectedDueDate) {
                  setState(() {
                    _selectedDueDate = selectedDate;
                  });
                }
              },
              child: Text(
                'Due Date: ${DateFormat('yyyy-MM-dd').format(_selectedDueDate)}', // Format the date as desired
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                // Retrieve the authentication token from SharedPreferences
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                final String? token = prefs.getString('token');

                if (token != null) {
                  // Get the user data including the user ID from the server
                  final userData = await DioProvider().getUser(token);

                  if (userData != null) {
                    final Map<String, dynamic> userMap = json.decode(userData);
                    final int userId =
                        userMap['id']; // Extract the user ID from user data

                    final TaskData task = TaskData(
                      taskType: _priorityController.text,
                      description: _descriptionController.text,
                      dueDate: _selectedDueDate,
                    );

                    final result =
                        await DioProvider().createTask(token, userId, task);

                    if (result != null) {
                      print('Task created: $result');
                      // Navigator.of(context).pop();
                    } else {
                      print('Failed to create task');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to create task'),
                        ),
                      );
                    }
                  } else {
                    print('Failed to fetch user data');
                  }
                } else {
                  print('Authentication token not found.');
                }
              },
              child: const Text('Create Task'),
            )
          ],
        ),
      ),
    );
  }
}
