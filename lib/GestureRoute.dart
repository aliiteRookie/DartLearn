import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureRouteState();
}

class GestureRouteState extends State<GestureRoute> {
  double _left = 0.0,
      _top = 0.0;
  double _width=200.0;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PointerEvent"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              child: CircleAvatar(
                child: Image.asset(
                 "assets/images/avatar.png",width: _width,
                ),
                backgroundColor: Colors.blue,
              ),
              onScaleUpdate: (ScaleUpdateDetails e){
                _width=200*e.scale.clamp(.8, 10.0);
              },
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                print(e.delta);
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}
