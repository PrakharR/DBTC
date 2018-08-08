import 'package:dbtc/models/app_state.dart';
import 'package:dbtc/models/user.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class UserLoginRequest {}

class UserLoginSuccess {
  final User user;
  UserLoginSuccess(this.user);
}

class UserLoginFailure {
  final String error;
  UserLoginFailure(this.error);
}

class UserLogout {}

final Function login = (BuildContext context, String username, String password) {
  return (Store<AppState> store) {
    // TODO: Perform user login actions
    store.dispatch(UserLoginRequest());
    if (username == 'asd' && password == 'asd') {
      store.dispatch(UserLoginSuccess(User('placeholder_token', 'placeholder_id')));
    } else {
      store.dispatch(UserLoginFailure('Username or password were incorrect.'));
    }
  };
};

final Function logout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(UserLogout());
  };
};