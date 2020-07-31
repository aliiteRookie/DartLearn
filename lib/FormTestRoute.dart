import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormTestState();
  }
}

class FormTestState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text("FormTest")
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或者邮箱",
                      prefixIcon: Icon(Icons.person)
                  ),
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空！";
                  },
                ), TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock)
                  ),
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能小于6位！";
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Expanded(
                      child: Row(
                        children: <Widget>[
                          Builder(builder: (context) {
                            return RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("登录"),
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  ScaffoldState state = context
                                      .findAncestorStateOfType<ScaffoldState>();
                                  state.showSnackBar(
                                      SnackBar(content: Text("登录成功"),));
                                }
                              },
                            );
                          })
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}