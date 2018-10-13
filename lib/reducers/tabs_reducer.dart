import 'package:dbtc/actions/tabs_actions.dart';
import 'package:dbtc/enums/AppTabEnum.dart';
import 'package:redux/redux.dart';

final tabsReducer = combineReducers<AppTabEnum>([
  TypedReducer<AppTabEnum, UpdateTabAction>(_activeTabReducer),
]);

AppTabEnum _activeTabReducer(AppTabEnum activeTab, UpdateTabAction action) {
  return action.newTab;
}