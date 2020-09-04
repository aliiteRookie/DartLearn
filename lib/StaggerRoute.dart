import 'package:dartlearn/StaggerAnimation.dart';
import 'package:flutter/material.dart';

class StaggerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StaggerState();
  }
}

class StaggerState extends State<StaggerRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 6000));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: StaggerAnimation(controller: _controller),
        ),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller
          .forward()
          .orCancel;
      await _controller
          .reverse()
          .orCancel;
    } on TickerCanceled {
      //animation got canceled,probably because we were disposed
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
