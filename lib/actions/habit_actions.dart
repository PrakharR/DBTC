import 'package:dbtc/models/habit.dart';

class AddHabitAction {
  final Habit habit;
  AddHabitAction(this.habit);
}
class RemoveHabitAction {
  final String habitId;
  RemoveHabitAction(this.habitId);
}

class AddReasonAction {}
class RemoveReasonAction {}
class UpdateNameAction {}