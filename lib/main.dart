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
      debugShowCheckedModeBanner: false,
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

class MyHomePage extends StatefulWidget {

  static List<bool> progressbarFlag = [false, false, false, false];
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    color: Colors.greenAccent,
                  ),
                ),
                ProgressBar(
                  offset: MyHomePage.progressbarFlag,
                )
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
                                TextSpan(
                                    text: 'Wecome to AI',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none)),
                                TextSpan(
                                    text: ' Agritech !',
                                    style: TextStyle(
                                        color: Colors.greenAccent,
                                        decoration: TextDecoration.none)),
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

                  MyCustomForm(),
                  SizedBox(
                    height: 30,
                  ),
                  
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

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
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
            padding: const EdgeInsets.only(top: 60),
            child: new TextFormField(
              decoration: new InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Enter your email",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  )),
              validator: (String value) {
                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                return emailValid ? null : 'Please provide valid email';
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: CustomButton('Getting Started', () {
              
              
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    MyHomePage.progressbarFlag = [false, false, false, false];
                  });
                });

                return Login();
              }));
                
              } else{
                // Scaffold.of(context)
                //     .showSnackBar(SnackBar(content: Text('Processing Data')));
              }

              
            }),
          ),
        ],
      ),
    );
  }
}
