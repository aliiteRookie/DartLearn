import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  AnimationController controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  StaggerAnimation({Key key, @required this.controller}) : super(key: key) {
    height = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.6,
          curve: Curves.ease,
        )));
    padding = Tween(
            begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
    color = ColorTween(begin: Colors.green, end: Colors.blue).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
  }

  Widget _buildWidget(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        height: height.value,
        color: color.value,
        width: 50.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      builder: _buildWidget,
      animation: controller,
    );
  }
}
