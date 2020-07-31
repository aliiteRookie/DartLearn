import 'package:flutter/material.dart';

class ClipRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget avatar = Image.network(
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596026166525&di=54d8a4d58cf24bd9904d564176ac3378&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F6e8f56b2543cce8bffa35b22d03684fae76a1b2c56c32-COdswi_fw658",
      width: 90,
      height: 90,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("clip route"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              avatar, //不剪裁
              ClipOval(child: avatar), //剪裁为圆形
              ClipRRect(
                //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                    child: ClipRect(
                      child: avatar,
                      clipper: new MyClipper(),
                    ),
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(
                    //将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .8, //宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  Text("你好世界", style: TextStyle(color: Colors.green))
                ],
              ),
            ],
          ),
        ));
  }

}
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, 60.0, 60.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
