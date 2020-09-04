import 'package:flutter/material.dart';

import 'HeroB.dart';

class HeroA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
        body: Container(
      alignment: Alignment.center,
      child: InkWell(
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext ctx, Animation animation,
                    Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("原图"),
                  ),
                  body: HeroB(),
                ),
              );
            }));
          },
          child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "assets/images/avatar.png",
                  width: 50,
                ),
              ))),
    ));
  }
}
