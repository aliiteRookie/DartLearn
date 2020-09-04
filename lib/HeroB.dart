import 'package:flutter/material.dart';

class HeroB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Hero(
      tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
      child: Image.asset(
        "assets/images/avatar.png",
      ),
    ));
  }
}
