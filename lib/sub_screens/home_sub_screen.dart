import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

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
        Expanded(child: Container(
          child: CalendarCarousel(
            onDayPressed: (DateTime date) {},
            thisMonthDayBorderColor: Colors.grey,
//            height: 420.0,
            selectedDateTime: DateTime.now(),
            daysHaveCircularBorder: null,
          ),
        )),
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