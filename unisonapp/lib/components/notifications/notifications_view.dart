import 'package:flutter/material.dart';
import 'package:unisonapp/data_classes/notifications_data.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  // Sample list of notifications
  final List<Notifications> notifications = [
    Notifications(
      from: 'Harsha',
      title: 'Important Notification',
      sentTime: 'October 15\n10:30 AM',
    ),
    Notifications(
      from: 'Chamaru',
      title: 'Reminder',
      sentTime: 'October 16\n2:00 PM',
    ),
        Notifications(
      from: 'Harsha',
      title: 'Important Notification',
      sentTime: 'October 15\n10:30 AM',
    ),
    Notifications(
      from: 'Chamaru',
      title: 'Reminder',
      sentTime: 'October 16\n2:00 PM',
    ),
    // Add more notifications here
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('Recieved at')),
          DataColumn(label: Text('View')),
        ],
        rows: notifications.map((notification) {
          return DataRow(
            cells: [
              DataCell(Text(notification.from)),
              DataCell(Text(notification.sentTime)),
              DataCell(
                TextButton(
                  onPressed: () {
                    // Handle "View" button click
                    print(
                        'View button clicked for notification: ${notification.title}');
                  },
                  child: const Text(
                    'View',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
