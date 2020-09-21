import 'package:bankai/screen3.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
          title: Text(
        "Create Account",
      )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: Stack(
                children: <Widget>[
                  ProgressBar(offset: [true, false, false, false]),
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
                        Text("Personal Information",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "Please fill in the form below and you goal for reaching out to us",
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, right: 10),
                          child: Column(
                            children: [
                              DropDownClass("Goal for Activation"),
                              DropDownClass("Monthly Income"),
                              DropDownClass("Monthly Expense")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomButton('Next', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Screen3();
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
