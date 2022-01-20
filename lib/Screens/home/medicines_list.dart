import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../model/pill.dart';
import '../../screens/home/medicine_card.dart';

class TasksList extends StatelessWidget {
  final List<Pill> listOfTasks;
  final Function setData;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  TasksList(
      this.listOfTasks, this.setData, this.flutterLocalNotificationsPlugin);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MedicineCard(
          listOfTasks[index], setData, flutterLocalNotificationsPlugin),
      itemCount: listOfTasks.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
