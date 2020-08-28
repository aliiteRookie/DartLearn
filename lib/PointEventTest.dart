import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PointerEventState();
}

class PointerEventState extends State<PointerEventRoute> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PointerEvent"),
      ),
//      body: Listener(
//        child: Container(
//          constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//          child: Center(
//              child: Text(
//            _event?.toString() ?? "",
//            style: TextStyle(color: Colors.blue),
//          )),
//        ),
//        onPointerDown: (PointerEvent event) {
//          setState(() {
//            print("down");
//            _event = event;
//          });
//        },
//        onPointerMove: (PointerEvent event) {
//          setState(() {
//            _event = event;
//          });
//        },
//        onPointerUp: (PointerEvent event) {
//          setState(() {
//            _event = event;
//          });
//        },
//        behavior: HitTestBehavior.opaque,
//      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            onPointerDown: (event)=>print("down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event)=>print("down1"),
            behavior: HitTestBehavior.opaque,
          )
        ],
      ),
    );
  }
}
