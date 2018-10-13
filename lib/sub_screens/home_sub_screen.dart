import 'package:flutter/material.dart';
import 'package:dbtc/presentation/Calendar.dart';

class HomeSubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[Text('Habit'), Text('To drink water everyday')],
        ),
        Row(
          children: <Widget>[Text('Why'), Text('Keeps me running')],
        ),
        Expanded(child: Calendar()),
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Longest Streak'), Text('25 days')],
            ),
            Row(
              children: <Widget>[Text('Current Streak'), Text('6 days')],
            )
          ],
        )
      ],
    );
  }
}