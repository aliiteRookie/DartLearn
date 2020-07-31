import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SwitchAndCheckBoxTestState();
  }
}

class SwitchAndCheckBoxTestState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchOpen = true;
  bool _checkBox = true;

  handleSwitch(bool value) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("SwitchAndCheckBox"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            Switch(
              value: _switchOpen,
              onChanged: (value) {
                setState(() {
                  _switchOpen = value;
                });
              },
            ),
            Checkbox(
              value: _checkBox,
              tristate: true,
              onChanged: (value) {
                setState(() {
                  _checkBox = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
