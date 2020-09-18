import 'package:flutter/material.dart';

class RectButton extends StatefulWidget {
  final String label;

  RectButton({Key key, @required this.label}) : super(key: key);

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

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  
  CustomButton(this.btnText, this.onBtnPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                btnText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: onBtnPressed);
  }
}
