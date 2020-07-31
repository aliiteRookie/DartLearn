import 'dart:async';

import 'package:dartlearn/ClipRoute.dart';
import 'package:dartlearn/ContainerRoute.dart';
import 'package:dartlearn/FormTestRoute.dart';
import 'package:dartlearn/NewRoute.dart';
import 'package:dartlearn/ParentWidget.dart';
import 'package:dartlearn/ProgressRoute.dart';
import 'package:dartlearn/RandomWordsWidget.dart';
import 'package:dartlearn/ScaffoldRoute.dart';
import 'package:dartlearn/SwitchAndCheckBoxTestRoute.dart';
import 'package:dartlearn/TapBoxA.dart';
import 'package:dartlearn/TextFieldRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    print("build");
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$t',
              style: Theme.of(context).textTheme.headline6,
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
                onPressed: () => {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                      Navigator.of(context).pushNamed("switch_checkbox_page")
                    }),
            RaisedButton(
                child: Text("open text field"),
                textColor: Colors.blue,
                onPressed: () => {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                      Navigator.of(context).pushNamed("text_field_page")
                    }),
            RaisedButton(
                child: Text("open form test"),
                textColor: Colors.blue,
                onPressed: () => {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                      Navigator.of(context).pushNamed("form_page")
                    }),
            RaisedButton(
                child: Text("open progress test"),
                textColor: Colors.blue,
                onPressed: () => {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                      Navigator.of(context).pushNamed("progress_page")
                    }),
            RaisedButton(
                child: Text("open container test"),
                textColor: Colors.blue,
                onPressed: () => {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                  Navigator.of(context).pushNamed("container_page")
                }),
            RaisedButton(
                child: Text("open clip test"),
                textColor: Colors.blue,
                onPressed: () => {
//                var result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                  Navigator.of(context).pushNamed("clip_page")
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
                          ScaffoldState _state =
                              context.findAncestorStateOfType<ScaffoldState>();
                          print(_state);
                          _state.showSnackBar(SnackBar(
                            content: Text("我是SnackBar"),
                          ));
                        });
            }),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ParentWidget(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
