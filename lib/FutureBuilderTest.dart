import 'package:flutter/material.dart';

class FutureBuilderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(
          primaryColor: Colors.greenAccent,
          iconTheme: IconThemeData(color: Colors.greenAccent)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("FutureBuilder"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: mockNetWorkData(),
            initialData: "waiting",
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('没有Stream');
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return Text('active: ${snapshot.data}');
                case ConnectionState.done:
                  return Text('Stream已关闭');
              }
            },
          ),
        ),
      ),);
  }

  Stream<int> mockNetWorkData() {
    return Stream.periodic(Duration(seconds: 2), (i) => i);
  }
}