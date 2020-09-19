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

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
              children: <Widget>[
                Container(
                  // color: Colors.lightBlue,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                    color: Colors.greenAccent,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularInd(),
                      AddLine(),
                      CircularInd(),
                      AddLine(),
                      CircularInd(),
                      AddLine(),
                      CircularInd()
                    ],
                  ),
                ),
              ],
            );
  }
}
// Indicates the Progress Bar

class CircularInd extends StatefulWidget {
  @override
  _CircularIndState createState() => _CircularIndState();
}

class _CircularIndState extends State<CircularInd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Text("2"),
    );
  }
}

class AddLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      width: 30.0,
      color: Colors.black,
    );
  }
}