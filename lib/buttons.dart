import 'package:flutter/material.dart';

class RectButton extends StatefulWidget {
  final String label;
  
  RectButton({Key key, @required this.label}) : super(key : key);

  @override
  _RectButtonState createState() => new _RectButtonState();
}

class _RectButtonState extends State<RectButton> {
  
  
  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOne()));
        Navigator.pushNamed(context, '/two');
      },
      child: Text(widget.label),
    );
  }
}
