import 'package:bankai/screen2.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  ProgressBar(offset: [true, false, false, false],),
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
                    padding: const EdgeInsets.only(top :20, bottom: 20, right: 10),
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
                  RichText(text: TextSpan(
                    text: 'Complexity :',
                    // style: DefaultTextStyle.of(context).style,
                    style: TextStyle(color: Colors.black)
                  )),
                  Placeholder(
                    fallbackHeight: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton('Next', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
