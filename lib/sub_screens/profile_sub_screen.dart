import 'package:flutter/material.dart';

class ProfileSubScreen extends StatelessWidget {
  String _habitName = 'Run Everyday';
  String _reason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit'),
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: PageTitleText("EDIT PAGE")
                ),

                OutlineTextField(
                    onChanged: (text) {
                      _habitName = text;
                      print(text);
                    },
                    labelText: 'Something you want to do regularly?',
                    prefixIconData: Icons.adjust
                ),
                Column(

                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //Text('1.'),
                        Flexible(
                            child: OutlineTextField(
                                onChanged: (text) {
                                  //text holds
                                  _reason = text;
                                  print(text);
                                },
                                labelText: ('One reason to do it everyday.'),
                                prefixIconData: Icons.whatshot
                            )
                        ),
                      ],
                    )
                  ],

                ),
                RaisedButton(
                    onPressed: () {
                      print('Edit has been submitted');
                      print('habit is: '+_habitName+ ' and the reason is '+_reason);

                      Habit habit = Habit('random', _habitName);
                      habit.addReason(_reason);

                    },
                    child: Text('Submit')
                )
              ],
            )));
  }
}

class OutlineTextField extends StatelessWidget {
  ValueChanged<String> onChanged;
  String labelText;
  IconData prefixIconData;
  OutlineTextField({this.onChanged, this.labelText, this.prefixIconData});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          labelText: labelText,
          prefixIcon: Icon(prefixIconData)
      ),
      onChanged: onChanged,
    );
  }
}

class PageTitleText extends StatelessWidget {

  String titleText;

  PageTitleText(this.titleText);

  @override
  Widget build(BuildContext context) {
    return Text(
        titleText,
        textAlign: TextAlign.left,
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 48.0)
    );
  }

}