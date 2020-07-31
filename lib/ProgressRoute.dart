import 'package:flutter/material.dart';

class ProgressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProgressState();
  }
}

class ProgressState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:60),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              value: _animationController.value,
              valueColor: ColorTween(begin: Colors.red, end: Colors.blue)
                  .animate(_animationController),
            ),
          )
        ],
      ),
    );
  }
}
