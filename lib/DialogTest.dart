import 'package:flutter/material.dart';

class DialogTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed: () async {
                bool result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("确认需要删除吗?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
                if (result) {
                  print("删除了");
                }
              },
            ),
            RaisedButton(
              child: Text("SimpleDialog"),
              onPressed: () async {
                var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text('请选择语言'),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                            child: Text("中文简体"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context, 2);
                            },
                            child: Text("中文繁体"),
                          )
                        ],
                      );
                    });
                if (result == 1) {
                  print("中文简体");
                }
              },
            ),
            RaisedButton(
              child: Text("Dialog"),
              onPressed: () async {
                var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(title: Text("请选择")),
                            Expanded(
                                child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text("$index"),
                                        onTap: () {
                                          Navigator.pop(context, index);
                                        },
                                      );
                                    },
                                    itemCount: 20))
                          ],
                        ),
                      );
                    });
                if (result == 1) {
                  print("中文简体");
                }
              },
            ),
            RaisedButton(
              child: Text("showGeneralDialog"),
              onPressed: (){
                showCustomDialog(context: context,builder: (context){
                  return AlertDialog(
                    title: Text("提示"),
                    content: Text("您确定要删除当前文件吗?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text("删除"),
                        onPressed: () {
                          // 执行删除操作
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}
