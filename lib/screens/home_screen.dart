import 'package:dbtc/actions/tabs_actions.dart';
import 'package:dbtc/enums/AppTabEnum.dart';
import 'package:dbtc/models/app_state.dart';
import 'package:dbtc/sub_screens/home_sub_screen.dart';
import 'package:dbtc/sub_screens/profile_sub_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActiveTab(
        builder: (BuildContext context, AppTabEnum activeTab) {
          return Scaffold(
            body: activeTab == AppTabEnum.home ? HomeSubScreen() : ProfileSubScreen(),
            bottomNavigationBar: TabSelector(),
          );
        }
        );
  }
}

class ActiveTab extends StatelessWidget {
  final ViewModelBuilder<AppTabEnum> builder;

  ActiveTab({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTabEnum>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.activeTab,
      builder: builder,
    );
  }
}

class TabSelector extends StatelessWidget {
  TabSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          currentIndex: AppTabEnum.values.indexOf(vm.activeTab),
          onTap: vm.onTabSelected,
          items: AppTabEnum.values.map((tab) {
            return BottomNavigationBarItem(
              icon: Icon(
                tab == AppTabEnum.home ? Icons.home : Icons.person,
              ),
              title: Text(tab == AppTabEnum.home
                  ? 'Home'
                  : 'Profile')
            );
          }).toList(),
        );
      },
    );
  }
}

class _ViewModel {
  final AppTabEnum activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeTab: store.state.activeTab ?? AppTabEnum.home,
      onTabSelected: (index) {
        store.dispatch(UpdateTabAction((AppTabEnum.values[index])));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;
}