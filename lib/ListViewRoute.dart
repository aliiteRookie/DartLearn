import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewState();
  }
}

class ListViewState extends State<ListViewRoute> {
  static final tag = "##loadingtag##";
  var _words = <String>[tag];
  bool showToTopBtn = false;
  ScrollController _controller = new ScrollController(keepScrollOffset: true);
  DateTime _lastTapTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print(_controller.position.pixels);
//      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("ListView"),
          ),
          body: ListView.separated(
            key: PageStorageKey(1),
            controller: _controller,
            itemCount: _words.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (_words[index] == tag) {
                if (_words.length - 1 < 100) {
                  retrieveData();
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    ),
                  );
                } else if (_words.length - 1 == 100) {
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "没有更多了",
                        style: TextStyle(color: Colors.grey),
                      ));
                }
              } else {
                return ListTile(title: Text(_words[index]));
              }
            },
            separatorBuilder: (context, index) => Divider(height: .0),
          ),
          floatingActionButton: !showToTopBtn
              ? null
              : FloatingActionButton(
                  child: Icon(Icons.arrow_upward),
                  onPressed: () {
                    _controller.animateTo(.0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                ),
        ),
        onWillPop: () async {
          print("back");
          if (_lastTapTime == null ||
              DateTime.now().difference(_lastTapTime) > Duration(seconds: 1)) {
            _lastTapTime = DateTime.now();
            return false;
          }
          return true;
        });
  }

  void retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
