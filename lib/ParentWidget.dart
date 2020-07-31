import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new TapBoxB(active: _active, onChanged: handleTapboxChanged);
  }
}

class TapBoxB extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool active;

  TapBoxB({Key key, @required this.active, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TapBoxBState();
  }
}

class TapBoxBState extends State<TapBoxB> {
  bool _highlight = false;

  handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      onTapCancel: handleTapCancel,
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      child: Transform(
          alignment: Alignment.topCenter,
          transform: new Matrix4.skewX(widget.active?0:0.5),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: double.infinity, maxWidth: 120.0),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 120.0, maxWidth: double.infinity),
                  child: Container(
                    child: new Center(
                        child: new Text(
                      widget.active ? "Active" : "InActive",
                      style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.double,
                          fontFamily: 'monaco'),
                    )),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0)
                        ],
                        border: _highlight
                            ? new Border.all(
                                color: widget.active
                                    ? Colors.blueGrey
                                    : Colors.orange[700],
                                width: 3)
                            : null,
                        borderRadius: BorderRadius.circular(3.0),
                        gradient: LinearGradient(
                            colors: widget.active
                                ? [Colors.blue, Colors.blueGrey]
                                : [Colors.red, Colors.orange[700]]),
                        color: widget.active
                            ? Colors.lightBlue[700]
                            : Colors.grey[600]),
                  )))),
    );
  }
}
