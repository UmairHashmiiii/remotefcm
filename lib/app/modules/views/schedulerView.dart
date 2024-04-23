import 'package:flutter/material.dart';

import '../../service/notificationService.dart';

class NotificationSchedulerScreen extends StatefulWidget {
  @override
  _NotificationSchedulerScreenState createState() =>
      _NotificationSchedulerScreenState();
}

class _NotificationSchedulerScreenState

    extends State<NotificationSchedulerScreen> {
  final TextEditingController _messageController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Scheduler'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () => _selectDateTime(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Select date and time',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      _selectedDateTime.toString(),
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Enter message',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String message = _messageController.text;

                _scheduleNotification(_selectedDateTime, message);

                debugPrint(
                    'Scheduled notification for $_selectedDateTime with message: $message');
              },
              child: Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }

  void _scheduleNotification(DateTime scheduledDateTime, String message) {
    NotificationService().scheduleNotification(
      title: 'Scheduled Notification',
      body: message,
      scheduledNotificationDateTime: scheduledDateTime,
    );
  }
}
