import 'package:dbtc/models/app_state.dart';
import 'package:dbtc/reducers/habit_reducer.dart';
import 'package:dbtc/reducers/tabs_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      habit: habitReducer(state.habit, action),
      activeTab: tabsReducer(state.activeTab, action)
  );
}