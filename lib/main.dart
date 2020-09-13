import 'package:flutter/material.dart';

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
      initialRoute:  '/',
      routes: {
        '/' : (context) => MyHomePage(),
        '/one' : (context) => ScreenOne(),
        '/two' : (context) => ScreenTwo()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          
          child: Column(
            children: <Widget>[
              Text("Welcome to GIN Finans", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              RaisedButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOne()));
                Navigator.pushNamed(context, '/one');
                
              },
                child: Text('Next Screen'),
              ),
              RaisedButton(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOne()));
                
                Navigator.pushNamed(context, '/two');
              },
                child: Text('Visit Screen two'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen one")),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen two")),
    );
  }
}