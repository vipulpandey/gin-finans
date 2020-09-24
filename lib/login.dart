import 'package:bankai/main.dart';
import 'package:bankai/screen2.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  List<bool> _progressbarFlag = [true, true, false,false];

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

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                          hintText: "Create Password",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          )),
                      validator: (String value) {
                        return value.contains("@") ? '@ is present' : null;
                      },
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Complexity :',
                          // style: DefaultTextStyle.of(context).style,
                          style: TextStyle(color: Colors.black))),
                 
                  Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(50),
        color: Colors.green,
      ),
      child: Icon(Icons.check),
    ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomButton('Next', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          print(" screen 2 working");
                          _progressbarFlag = [true, true, false, false];
                          
                        });
                      });
                      return Screen2();
                    }));
                  }),
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
