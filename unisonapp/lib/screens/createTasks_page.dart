import 'package:flutter/material.dart';

class CreateTasks extends StatelessWidget {
  const CreateTasks({Key? key}) : super(key: key);

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
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'New Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add spacing

            // Title input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing

            // Description input field
            Container(
              height: 400, // Adjust the height as needed
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                maxLines: null, // Allows the input field to expand vertically
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Create Task button
            ElevatedButton(
              onPressed: () {
                // Handle the "Create Task" button tap
              },
              child: Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
