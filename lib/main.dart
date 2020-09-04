import 'dart:async';

import 'package:dartlearn/AnimationSwitcherRoute.dart';
import 'package:dartlearn/ClipRoute.dart';
import 'package:dartlearn/ContainerRoute.dart';
import 'package:dartlearn/CustomScrollViewRoute.dart';
import 'package:dartlearn/DialogTest.dart';
import 'package:dartlearn/FormTestRoute.dart';
import 'package:dartlearn/FutureBuilderTest.dart';
import 'package:dartlearn/ListViewRoute.dart';
import 'package:dartlearn/NewRoute.dart';
import 'package:dartlearn/ParentWidget.dart';
import 'package:dartlearn/PointEventTest.dart';
import 'package:dartlearn/ProgressRoute.dart';
import 'package:dartlearn/RandomWordsWidget.dart';
import 'package:dartlearn/ScaffoldRoute.dart';
import 'package:dartlearn/ScaleAnimationRoute.dart';
import 'package:dartlearn/SingleChildScrollViewRoute.dart';
import 'package:dartlearn/StaggerRoute.dart';
import 'package:dartlearn/SwitchAndCheckBoxTestRoute.dart';
import 'package:dartlearn/TapBoxA.dart';
import 'package:dartlearn/TextFieldRoute.dart';
import 'package:dartlearn/GridViewRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GestureRoute.dart';
import 'HeroA.dart';

void main() {
//  FlutterError.onError = (FlutterErrorDetails details) {
  //上报异常
//  };
//  runZoned(() => MyApp(), zoneSpecification: new ZoneSpecification(
//      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//        手机日志
//    parent.print(zone, "Intercepted:$line");
//  }),onError: (Object object,StackTrace stack){
//    上报异常
//  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "form_page": (context) => FormTestRoute(),
        "progress_page": (context) => ProgressRoute(),
        "container_page": (context) => ScaffoldRoute(),
        "clip_page": (context) => ClipRoute(),
        "listview_page": (context) => ListViewRoute(),
        "futurebuilder_page": (context) => FutureBuilderTest(),
      },
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        if (routeName == "new_page") {
          return MaterialPageRoute(
              builder: (context) => NewRoute(text: settings.arguments));
        } else if (routeName == "switch_checkbox_page") {
          return MaterialPageRoute(
              builder: (context) => SwitchAndCheckBoxTestRoute());
        } else if (routeName == "text_field_page") {
          return MaterialPageRoute(builder: (context) => TextFieldRoute());
        } else if (routeName == "grid_page") {
          return MaterialPageRoute(builder: (context) => GridViewRoute());
        } else if (routeName == "customScrollView_page") {
          return MaterialPageRoute(
              builder: (context) => CustomScrollViewRoute());
        }
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    initialRoute: "/",
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var t;
  bool _enable = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      t = "hi string";
      execute(par: "histring");
    });
  }

  void execute({String par}) {
    _enable = !_enable;
    if (_enable) {
      t = "string";
    } else {
      t = par;
    }
  }

  @override
  void initState() {
    super.initState();
    t = "initState";
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  static final tag = "##loadingtag##";
  var _words = <String>[tag];

  @override
  Widget build(BuildContext context) {
    print("build");
    _words.insert(0, "123");
    print(_words[1]);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$t',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  RaisedButton(
                    child: Text("open new route"),
                    textColor: Colors.blue,
                    onPressed: () async {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                      var result = await Navigator.of(context)
                          .pushNamed("new_page", arguments: "         hi");
                      print(result);
                    },
                  ),
                  RaisedButton(
                      child: Text("open switch check"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("switch_checkbox_page")
                      }),
                  RaisedButton(
                      child: Text("open text field"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("text_field_page")
                      }),
                  RaisedButton(
                      child: Text("open form test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("form_page")
                      }),
                  RaisedButton(
                      child: Text("open progress test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("progress_page")
                      }),
                  RaisedButton(
                      child: Text("open container test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("container_page")
                      }),
                  RaisedButton(
                      child: Text("open clip test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("clip_page")
                      }),
                  RaisedButton(
                      child: Text("open listview test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("listview_page")
                      }),
                  RaisedButton(
                      child: Text("open gridview test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("grid_page")
                      }),
                  RaisedButton(
                      child: Text("open customScrollView test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("customScrollView_page")
                      }),
                  RaisedButton(
                      child: Text("open futureBuilder test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).pushNamed("futurebuilder_page")
                      }),
                  RaisedButton(
                      child: Text("open Dialog test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DialogTest()))
                      }),
                  RaisedButton(
                      child: Text("open PointEvent test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PointerEventRoute()))
                      }),
                  RaisedButton(
                      child: Text("open Gesture test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return new FadeTransition(
                                  opacity: animation, child: GestureRoute());
                            }))
                      }),
                  RaisedButton(
                      child: Text("open ScaleAnimation test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ScaleAnimationRoute()))
                      }),
                  RaisedButton(
                      child: Text("open Hero test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).push(
                            CupertinoPageRoute(builder: (context) => HeroA()))
                      }),
                  RaisedButton(
                      child: Text("open Stagger test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) =>
                                Scaffold(body: StaggerRoute())))
                      }),
                  RaisedButton(
                      child: Text("open Stagger test"),
                      textColor: Colors.blue,
                      onPressed: () =>
                      {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                        scaffoldPush(context, AnimationSwitcherRoute())
                      }),
                  Builder(builder: (context) {
                    return RaisedButton.icon(
                        elevation: 3.0,
                        label: Text("show SnackBar"),
                        icon: Icon(Icons.add_comment),
                        textColor: Colors.white,
                        color: Colors.blue,
                        splashColor: Colors.blueGrey,
                        highlightColor: Colors.red,
                        disabledColor: Colors.grey,
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: _enable
                            ? null
                            : () {
                          ScaffoldState _state = context
                              .findAncestorStateOfType<ScaffoldState>();
                          print(_state);
                          _state.showSnackBar(SnackBar(
                            content: Text("我是SnackBar"),
                          ));
                        });
                  }),
//              Padding(
//                padding: const EdgeInsets.only(top: 20.0),
//                child: SingleChildScrollViewRoute(),
//              )
                ],
              ),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void scaffoldPush(context, Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: Text(route.toStringShort())), body: route);
    }));
  }
}
