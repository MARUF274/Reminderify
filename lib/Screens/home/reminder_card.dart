import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import '../../database/repository.dart';
import '../../model/pill.dart';
import '../../notifications/notifications.dart';

class ReminderCard extends StatelessWidget {
  final Pill reminder;
  final Function setData;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  ReminderCard(
      this.reminder, this.setData, this.flutterLocalNotificationsPlugin);

  @override
  Widget build(BuildContext context) {
    
    final bool isEnd = DateTime.now().millisecondsSinceEpoch > reminder.time;

    return Card(
        elevation: 0.0,
        margin: EdgeInsets.symmetric(vertical: 7.0),
        color: Colors.white,
        child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onLongPress: () => _showDeleteDialog(
                context, reminder.name, reminder.id, reminder.notifyId),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            title: Text(
              reminder.name,
              style: Theme.of(context).textTheme.headline1.copyWith(
                  color: Colors.black,
                  fontSize: 20.0,
                  decoration: isEnd ? TextDecoration.lineThrough : null),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "${reminder.amount} ${reminder.reminderForm}",
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.grey[600],
                  fontSize: 15.0,
                  decoration: isEnd ? TextDecoration.lineThrough : null),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat("HH:mm").format(
                      DateTime.fromMillisecondsSinceEpoch(reminder.time)),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      decoration: isEnd ? TextDecoration.lineThrough : null),
                ),
              ],
            ),
            ));
  }

  //--------------------------| SHOW THE DELETE DIALOG ON THE SCREEN |-----------------------

  void _showDeleteDialog(
      BuildContext context, String reminderName, int reminderId, int notifyId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete ?"),
              content: Text("Are you sure to delete $reminderName ?"),
              contentTextStyle:
                  TextStyle(fontSize: 17.0, color: Colors.grey[800]),
              actions: [
                FlatButton(
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Text("Delete",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  onPressed: () async {
                    await Repository().deleteData('Pills', reminderId);
                    await Notifications().removeNotify(
                        notifyId, flutterLocalNotificationsPlugin);
                    setData();
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }
  //============================================================================================

}
