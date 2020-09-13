import 'package:flutter/material.dart';
import 'buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
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
      body: Center(
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
                Positioned(
                  top: 100,
                  left: 30,
                  child: Row(
                    children: [
                      CircularInd(),
                      CircularInd(),
                      CircularInd(),
                      CircularInd()
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Welcome to Agritech AI",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Text(
                      "You will get AI services for the range of Use Cases",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Placeholder(
                    fallbackHeight: 70,
                  ),
                  Wrap(
                    children: <Widget>[
                      RectButton(label: "1",),
                      RectButton(label: "2",),
                      RectButton(label: "3",),
                      RectButton(label: "4",)
                    ],
                  )
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
      child: Text("1"),
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
