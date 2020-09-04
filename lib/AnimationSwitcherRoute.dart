import 'package:flutter/material.dart';

class AnimationSwitcherRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimationSwitcherState();
  }
}

class AnimationSwitcherState extends State<AnimationSwitcherRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return MySlideTransation(
                  position: tween.animate(animation), child: child);
            },
            duration: Duration(milliseconds: 500),
            child: Text(
              "$_count",
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          RaisedButton(
            child: Text("increment"),
            onPressed: () {
              setState(() {
                ++_count;
              });
            },
          )
        ],
      ),
    );
  }
}

class MySlideTransation extends AnimatedWidget {
  final bool transformHitTests;
  final Widget child;

  Animation<Offset> get position => listenable;

  MySlideTransation(
      {Key key,
      @required Animation<Offset> position,
      this.transformHitTests,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
