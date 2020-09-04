import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureRouteState();
}

class GestureRouteState extends State<GestureRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  double _width = 500.0;
  bool _toggle = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("PointerEvent"),
        ),
        body: Center(
          child: Text.rich(TextSpan(children: [
            TextSpan(text: "你好世界"),
            TextSpan(
                text: "点我变色",
                style: TextStyle(
                    fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  }),
          ])
//              onPanDown: (DragDownDetails e) {
//                //打印手指按下的位置(相对于屏幕)
//                print("用户手指按下：${e.globalPosition}");
//              },
//              onHorizontalDragUpdate: (DragUpdateDetails e) {
//                print(e.delta);
//                setState(() {
//                  _left += e.delta.dx;
//                  _top += e.delta.dy;
//                });
//              },
//              onPanEnd: (DragEndDetails e) {
//                print(e.velocity);
//              },
              ),
        ));
  }
}
