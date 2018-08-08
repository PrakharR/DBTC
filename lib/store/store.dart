import 'package:redux/redux.dart';
import 'package:dbtc/models/app_state.dart';
import 'package:dbtc/reducers/app_reducer.dart';

Store<AppState> createStore() {
  return Store(appReducer, initialState: AppState());
}