import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agritech AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,  
        primaryColor: Colors.greenAccent,      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/one': (context) => ScreenOne(),
        '/two': (context) => ScreenTwo(),
        '/three': (context) => ScreenThree(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title : Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
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
                ProgressBar(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RichText(                            
                            textScaleFactor: 0.8,
                            text: TextSpan(
                              // text: 'Welcome to ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Wecome to AI', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                                TextSpan(text: ' Agritech !', style: TextStyle(color : Colors.greenAccent, decoration: TextDecoration.none)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              "You will get Artificial Intelligence services for the range of Use Cases in the agriculture Industry. Experience the future ! ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "Enter your email",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          )),
                      validator: (String value) {
                        return value.contains("@") ? '@ is present' : null;
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  CustomButton('Getting Started',  (){
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context){
                        return Login();
                      }
                      )
                    );
                  }
                  ),
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

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen one ")),
      body: Container(
          child: Text(
        " Get the digital mapping of your field done!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      )),
    );
  }
}





class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen two( Digital Mapping)")),
      body: Container(
          child: Text(
        " Get the digital mapping of your field done!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      )),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen two( Digital Mapping)")),
      body: Container(
          child: Text(
        " Get the digital mapping of your field done!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      )),
    );
  }
}
