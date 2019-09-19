import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  return runApp(MaterialApp(
    home: TweakRemoteState(),
  ));
}

class TweakRemoteState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TweakRemote();
  }
}

class TweakRemote extends State<TweakRemoteState> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  new Sides(Colors.blueGrey),
                  new Sides(Colors.deepOrangeAccent)
                ],
              ),
            )
          ]),
    );
  }
}

class Sides extends StatelessWidget {
  final Color color;
  Sides(this.color);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: color,
              width: double.infinity,
              child: new KeypadLayout(),
            ),
          )
        ],
      ),
    );
  }
}

class KeypadLayout extends StatelessWidget {
  const KeypadLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        color: Colors.transparent,
        child: Card(
          shape: CircleBorder(),
          color: Colors.blueGrey.shade900,
          child: new StackForButtons(),
        ),
      ),
    );
  }
}

class StackForButtons extends StatelessWidget {
  const StackForButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ButtonForRemote(Alignment.topCenter,Colors.indigoAccent),
        ButtonForRemote(Alignment.bottomCenter,Colors.pink),
        ButtonForRemote(Alignment.centerLeft,Colors.amber),
        ButtonForRemote(Alignment.centerRight,Colors.deepPurple)
      ],
    );
  }
}

class ButtonForRemote extends StatelessWidget {
  final Alignment alignment;
  final Color color;
  ButtonForRemote(this.alignment,this.color);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: (){
          print("PRESSED");
        },
        child: Container(
          height: 90,
          width: 90,
          child: Card(
              shape: CircleBorder(),
              color: color,
              margin: EdgeInsets.all(10)),
        ),
      ),
    );
  }
}
