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

// Shows the progress of the form filling
class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
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
    );
  }
}
// Circular indicator for the Progress Bar

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
        border: Border.all(width: 1),
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

//  Drop down Widget

class DropDownClass extends StatefulWidget {
  @override
  _DropDownClassState createState() => _DropDownClassState();
}

class _DropDownClassState extends State<DropDownClass> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(        
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Goal for activation",
                style: TextStyle(fontSize: 12),
              ),
              DropdownButton(
                  value: _value,                
                  hint: Text("hi there"), 
                  isExpanded: true,               
                  items: [
                    DropdownMenuItem(
                      child: Text('- Choose Option -'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('First item'),
                      value: 2,
                    )
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _value = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
