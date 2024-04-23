import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modules/views/schedulerView.dart';

class FcmAPP extends StatelessWidget {
  const FcmAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  NotificationSchedulerScreen(),
    );
  }
}
