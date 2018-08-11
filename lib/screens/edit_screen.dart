import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Edit page button'),
          onPressed: () {

          },
        ),
      )
    );
  }
}
