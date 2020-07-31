import 'package:flutter/material.dart';

class ContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("container"),
      ),
      body: Container(
        width: 200.0,
        height: 150.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 60.0, left: 120.0),
        child: Text(
          "5.20",
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        transform: Matrix4.rotationZ(.2),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.red, Colors.orange],
                radius: .98,
                center: Alignment.centerLeft),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
      ),
    );
  }
}
