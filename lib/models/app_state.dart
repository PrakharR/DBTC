import 'package:dbtc/enums/AppTabEnum.dart';
import 'package:meta/meta.dart';
import 'package:dbtc/models/user.dart';
import 'package:dbtc/models/habit.dart';

@immutable
class AppState {
  final User user;
  final Habit habit;
  final AppTabEnum activeTab;

  AppState({this.user, this.habit, this.activeTab = AppTabEnum.home});
}