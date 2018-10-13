import 'package:dbtc/actions/habit_actions.dart';
import 'package:dbtc/models/habit.dart';
import 'package:redux/redux.dart';

final habitReducer = combineReducers<Habit>([
  TypedReducer<Habit, AddHabitAction>(_addHabit),
  TypedReducer<Habit, RemoveHabitAction>(_removeHabit),
]);

Habit _addHabit(Habit habit, AddHabitAction action) {
  return action.habit;
}

Habit _removeHabit(Habit habit, RemoveHabitAction action) {
  return null;
}