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
        color: Colors.green,
        onPressed: onBtnPressed);
  }
}

// Shows the progress of the form filling
class ProgressBar extends StatefulWidget {  

  final List<bool> offset;

  ProgressBar({Key key, this.offset});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  
  List<bool> offsetState;
  
  @override
  void initState() {
    // TODO: implement initState
    offsetState = widget.offset;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {    

    print("----");    
    print(widget.offset);

    return Positioned(
      top: 50,
      left: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularInd("1", getColor(widget.offset[0])),
          AddLine(),
          CircularInd("2", getColor(widget.offset[1])),
          AddLine(),
          CircularInd("3", getColor(widget.offset[2])),
          AddLine(),
          CircularInd("4", getColor(widget.offset[3]))
        ],
      ),
    );
  }
}

// get color conditional
Color getColor(bool selector){
  if(selector){
    print(" conitional -----");
    print(selector);
    return Colors.yellow[700];
  }
  else{
    print("----red color");
    return Colors.white;
  }
}
// Circular indicator for the Progress Barr

class CircularInd extends StatefulWidget {

  final String indText;
  final Color color;

  CircularInd(this.indText, this.color);

  @override
  _CircularIndState createState() => _CircularIndState();
}

class _CircularIndState extends State<CircularInd> {
  @override
  Widget build(BuildContext context) {
    
    print(widget.color);

    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(50),
        color: widget.color,
      ),
      child: Text(widget.indText, style: TextStyle(fontSize: 20),),
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

  final String hintText;

  DropDownClass(this.hintText);

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
              Text(widget.hintText,
                style: TextStyle(fontSize: 12, color: Colors.grey),
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






