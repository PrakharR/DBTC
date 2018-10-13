import 'dart:async';
import 'package:flutter/material.dart';
import 'package:small_calendar/small_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => new CalendarState();
}

class CalendarState extends State<Calendar> {
  bool _showWeekdayIndication = true;
  bool _showTicks = true;

  SmallCalendarPagerController _smallCalendarPagerController;
  SmallCalendarDataController _smallCalendarDataController;

  @override
  void initState() {
    super.initState();

    DateTime initialMonth = new DateTime.now();
    DateTime minimumMonth = initialMonth;
    DateTime maximumMonth = new DateTime(initialMonth.year + 1, initialMonth.month);

    _smallCalendarPagerController = new SmallCalendarPagerController(
      initialMonth: initialMonth,
      minimumMonth: minimumMonth,
      maximumMonth: maximumMonth,
    );
    _smallCalendarDataController = new SmallCalendarDataController();
    _updateDisplayedMonthText();
  }

  void _updateDisplayedMonthText() {
    setState(() {});
  }

  Future<bool> _isTodayCallback(DateTime date) async {
    DateTime now = new DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  Future<bool> _isSelectedCallback(DateTime date) async {
    return false;
  }

  Future<bool> _hasTick1Callback(DateTime date) async {
    return false;
  }

  Future<bool> _hasTick2Callback(DateTime date) async {
    return false;
  }

  Future<bool> _hasTick3Callback(DateTime date) async {
    await new Future.delayed(new Duration(seconds: 1));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return new Builder(builder: (BuildContext context) {
      return new SmallCalendarData(
          firstWeekday: DateTime.monday,
          isTodayCallback: _isTodayCallback,
          isSelectedCallback: _isSelectedCallback,
          hasTick1Callback: _hasTick1Callback,
          hasTick2Callback: _hasTick2Callback,
          hasTick3Callback: _hasTick3Callback,
          controller: _smallCalendarDataController,
          child: new SmallCalendarStyle(
              showWeekdayIndication: _showWeekdayIndication,
              weekdayIndicationStyle: new WeekdayIndicationStyle(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              dayStyle: new DayStyle(
                showTicks: _showTicks,
                tick3Color: Colors.orange,
              ),
              child: new SmallCalendarPager(
                  controller: _smallCalendarPagerController,
                  onMonthChanged: (DateTime month) {
                    _updateDisplayedMonthText();
                  },
                  pageBuilder: (BuildContext context, DateTime month) {
                    return new SmallCalendar(
                        month: month,
                        onDayTap: (DateTime day) {
                          print("Pressed on: ${day.year}.${day.month}.${day.day}");
                        }
                    );
                  }
              )
          )
      );
    });
  }
}