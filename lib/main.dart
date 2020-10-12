import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter theme',
      debugShowCheckedModeBanner: false,
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  SharedPreferencesDemo({Key key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  bool color;

  red() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      get();
      prefs.setBool('boolValue', true);
    });
  }

  blue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      get();
      prefs.setBool('boolValue', false);
    });
  }

  get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      color = prefs.getBool('boolValue') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color == true ? Colors.red : Colors.blue,
      appBar: AppBar(
        title: const Text("Flutter theme"),
        centerTitle: true,
        backgroundColor: color == true ? Colors.red : Colors.blue,
      ),
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  child: Text("Red",
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                  onPressed: (){
                    red();
                  }
              ),
              RaisedButton(
                  child: Text("Blue",
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                  onPressed: (){
                    blue();
                  }
              ),
            ],
          )
      ),
    );
  }
}