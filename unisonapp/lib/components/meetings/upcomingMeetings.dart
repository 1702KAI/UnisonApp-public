import 'package:flutter/material.dart';
import 'package:unisonapp/utils/config.dart';

import '../../data_classes/meetings_data.dart';

class UpcomingMeetings extends StatefulWidget {
  const UpcomingMeetings({Key? key}) : super(key: key);

  @override
  State<UpcomingMeetings> createState() => _UpcomingMeetingsState();
}

class _UpcomingMeetingsState extends State<UpcomingMeetings> {
  final List<Meeting> meetings = [
    Meeting(
      name: 'Team Meeting',
      time: DateTime(2023, 10, 15, 10, 0),
      duration: Duration(hours: 1),
    ),
    Meeting(
      name: 'Project Update',
      time: DateTime(2023, 10, 20, 15, 30),
      duration: Duration(minutes: 45),
    ),
        Meeting(
      name: 'Team Meeting',
      time: DateTime(2023, 10, 15, 10, 0),
      duration: Duration(hours: 1),
    ),
    Meeting(
      name: 'Project Update',
      time: DateTime(2023, 10, 20, 15, 30),
      duration: Duration(minutes: 45),
    ),
    // Add more meetings here
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        dividerThickness: 0,
        columns: const [
          DataColumn(label: Text('Meeting Time')),
          DataColumn(label: Text('Duration')),
          DataColumn(label: Text('     Join')),
        ],
        rows: meetings.map((meeting) {
          return DataRow(
            cells: [
              DataCell(Text(
                '${meeting.time.hour}:${meeting.time.minute}',
              )),
              DataCell(Text(
                '${meeting.duration.inHours}h ${meeting.duration.inMinutes % 60}m',
              )),
              DataCell(
                TextButton(
                  onPressed: () {
                    // Handle joining the meeting here
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.zero,
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Config.primaryColor, // Border color
                      ),
                    ),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(
                      color: Config.secondaryColor, // Button text color
                      decoration: TextDecoration.underline, // Add underline
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
