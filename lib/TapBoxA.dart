import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TapBoxAState();
  }
}

class TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Active" : "InActive",
            style: new TextStyle(fontSize: 30, color: Colors.white,

            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration:new BoxDecoration(color: _active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}
