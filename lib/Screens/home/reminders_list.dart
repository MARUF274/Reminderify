import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../model/pill.dart';
import '../../screens/home/reminder_card.dart';

class RemindersList extends StatelessWidget {
  final List<Pill> listOfReminders;
  final Function setData;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  RemindersList(
      this.listOfReminders, this.setData, this.flutterLocalNotificationsPlugin);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ReminderCard(
          listOfReminders[index], setData, flutterLocalNotificationsPlugin),
      itemCount: listOfReminders.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
