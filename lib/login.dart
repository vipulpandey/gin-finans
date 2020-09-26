import 'package:bankai/main.dart';
import 'package:bankai/screen2.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<bool> _progressbarFlag = [true, false, false, false];
  List<bool> _passwordFlag = [
    false,
    false,
    false,
    false
  ]; // [lowercase, uppercase, number , characters]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      appBar: AppBar(
          title: Text(
        "Create Account",
      )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  ProgressBar(
                    offset: this._progressbarFlag,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Create Password",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          " Password will be used to login",
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                  //   child: new TextFormField(
                  //     decoration: new InputDecoration(
                  //         hintText: "Create Password",
                  //         fillColor: Colors.white,
                  //         border: new OutlineInputBorder(
                  //           borderRadius: new BorderRadius.circular(25.0),
                  //         )),
                  //     validator: (String value) {
                  //       return value.contains("@") ? '@ is present' : 'not present';
                  //     },
                  //   ),
                  // ),
                  MyCustomForm1([true, true, true, true]),

                  // Wrap(
                  //   children: <Widget>[
                  //     RectButton(label: "1",),
                  //     RectButton(label: "2",),
                  //     RectButton(label: "3",),

                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomForm1 extends StatefulWidget {
  List<bool> indicatorFlag;

  MyCustomForm1(this.indicatorFlag);

  @override
  _MyCustomForm1State createState() => _MyCustomForm1State();
}

class _MyCustomForm1State extends State<MyCustomForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: new TextFormField(
                decoration: new InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Create Password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    )),
                validator: (String value) {
                  Pattern pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = new RegExp(pattern);

                  // lowercase
                  bool lowercaseValid = RegExp(r'^[a-z]+$').hasMatch(value);
                  // uppercase
                  bool uppercaseValid = RegExp(r'^[A-Z]+$').hasMatch(value);
                  // Number
                  bool numValid = RegExp(r'(?=.*[0-9])+$').hasMatch(value);
                  // Character

                  if (value.isEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.indicatorFlag = [true, true, true, true];
                      });
                    });
                    return 'Please enter password';
                  } else if (value.length > 9) {

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.indicatorFlag = [true,true , true, false];
                      });
                    });
                    return "";
                  } else if (lowercaseValid) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.indicatorFlag = [false, true, true, true];
                      });
                    });

                    return "";
                  }else if (uppercaseValid) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.indicatorFlag = [false, false, true, true];
                      });
                    });

                    return "";
                  }
                   else {
                    if (!regex.hasMatch(value))
                      return 'Enter valid password';
                    else
                      return null;
                  }
                }),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: 'Complexity :',
                  // style: DefaultTextStyle.of(context).style,
                  style: TextStyle(color: Colors.black))),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                children: [
                  PasswordValidator(widget.indicatorFlag[0], "a"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Lowercase")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  PasswordValidator(widget.indicatorFlag[1], "A"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Uppercase")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  PasswordValidator(widget.indicatorFlag[2], "123"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Numbers")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  PasswordValidator(widget.indicatorFlag[3], "9+"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Characters")
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CustomButton('Next', () {
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      MyHomePage.progressbarFlag = [true, false, false, false];
                    });
                  });

                  return Login();
                }));
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              } else {
                print("--testing");
              }
            }),
          ),
        ],
      ),
    );
  }
}


class PasswordValidator extends StatefulWidget {
  final bool flag;
  final String label;
  
  PasswordValidator(this.flag, this.label);

  @override
  _PasswordValidatorState createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  @override
  Widget build(BuildContext context) {
    return widget.flag ? getPasswordWidget(true, widget.label)  : GreenIndicator();
  }
}

class GreenIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(50),
        color: Colors.green,
      ),
      child: Icon(Icons.check),
    );
  }
}

class TextIndicator extends StatelessWidget {
  final String label;

  TextIndicator(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Text(
        this.label,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

Widget getPasswordWidget(condition, label) {
  final bool condition = false;

  return condition ? GreenIndicator() : TextIndicator(label);
}
