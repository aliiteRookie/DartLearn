import 'package:flutter/material.dart';

class TextFieldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldState();
  }
}

class TextFieldState extends State<TextFieldRoute> {
  FocusNode node1 = new FocusNode();
  FocusNode node2 = new FocusNode();
  FocusScopeNode _scopeNode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldState"),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            focusColor: Colors.red,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.blue, fontSize: 15.0),
              hintStyle: TextStyle(color: Colors.grey),
            )),
        child: Container(
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "用户名",
                textAlign: TextAlign.left,
              ),
              Container(
                child: TextField(
                  focusNode: node1,
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 12, 16, 12),
                      hintText: "用户名或者邮箱",
                      border: InputBorder.none),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0x0d0e2333),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              TextField(
                focusNode: node2,
                onChanged: (value) {
                  print(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "输入正确密码",
                    prefixIcon: Icon(Icons.person)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
