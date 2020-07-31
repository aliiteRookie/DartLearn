import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  NewRoute({Key key, @required this.text}) :super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("NewRoute")),
      body:  SingleChildScrollView(
          child:Column(
              mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(child: Text("click here"),
                  onPressed: ()=>
                      Navigator.pop(context,"这是捎回来的话")),
              Text(text),
              Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1595240262009&di=2e55404017169e132c004853e7d7164b&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F14%2F75%2F01300000164186121366756803686.jpg",
                width: 500,
                height: 500,
                repeat: ImageRepeat.repeatY,
                )
            ],
          )
      ),
    );
  }
}
