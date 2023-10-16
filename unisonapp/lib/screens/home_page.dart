import 'package:flutter/material.dart';
import 'package:unisonapp/components/meetings/upcomingMeetings.dart';
import 'package:unisonapp/components/notifications/notifications_view.dart';
import 'package:unisonapp/components/tasks/tasksOverview.dart';
import 'package:unisonapp/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Upcoming Tasks',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // padding:
                // const EdgeInsets.all(8.0), // Add padding for the border
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      child: TasksOverview(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'viewTasks');
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Config
                            .primaryColor, // Set the button's background color to green
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Config.secondaryColor,
                          ), // Add your button icon here
                          SizedBox(width: 8.0),
                          Text(
                            'Go to Tasks',
                            style: TextStyle(color: Config.secondaryColor),
                          ), // Button text
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Config.spaceSmall,
              const Text(
                'Upcoming Meetings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                // padding:
                // const EdgeInsets.all(8.0), // Add padding for the border
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      child: UpcomingMeetings(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Config
                            .primaryColor, // Set the button's background color to green
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Config.secondaryColor,
                          ), // Add your button icon here
                          SizedBox(width: 8.0),
                          Text(
                            'Go to Meetings',
                            style: TextStyle(color: Config.secondaryColor),
                          ), // Button text
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Config.spaceSmall,
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                // padding:
                // const EdgeInsets.all(8.0), // Add padding for the border
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      child: NotificationsView(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Config
                            .primaryColor, // Set the button's background color to green
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Config.secondaryColor,
                          ), // Add your button icon here
                          SizedBox(width: 8.0),
                          Text(
                            'Go to Notifications',
                            style: TextStyle(color: Config.secondaryColor),
                          ), // Button text
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Config.spaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}
