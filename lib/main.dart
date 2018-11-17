import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dbtc/screens/home_screen.dart';
import 'package:dbtc/store/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: createStore(),
      child: MaterialApp(
        title: 'DBTC',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: HomeScreen(),
      ),
    );
  }
}