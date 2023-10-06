import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/config.dart';
import '../button.dart';

Widget bottomDrawerNavigation(BuildContext context) {
  return IconButton(
    onPressed: () {
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation1, animation2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Config.heightSize / 2,
              width: Config.widthSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Button(
                    width: double.infinity,
                    title: 'Tasks',
                    onPressed: () {
                      // Handle "Tasks" button tap
                    },
                    disable: false,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'Contact',
                    onPressed: () {
                      // Handle "Contact" button tap
                    },
                    disable: false,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'Company',
                    onPressed: () {
                      // Handle "Company" button tap
                    },
                    disable: false,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'Email',
                    onPressed: () {
                      // Handle "Email" button tap
                    },
                    disable: false,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'Ticket',
                    onPressed: () {
                      // Handle "Ticket" button tap
                    },
                    disable: false,
                  ),
                  Button(
                    width: double.infinity,
                    title: 'Social Post',
                    onPressed: () {
                      // Handle "Social Post" button tap
                    },
                    disable: false,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
    icon: const Icon(
      Icons.add,
      color: Colors.black,
    ),
  );
}
