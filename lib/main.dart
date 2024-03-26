import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool allowClose = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DoubleBack(
        condition: allowClose,
        onConditionFail: () {
          setState(() {
            allowClose = true;
          });
        },
        // message: "Press back again to exit",
        child: MyHomePage(title: "Example"),
        // onFirstBackPress: (context) {
        //   // change this with your custom action
        //   final snackBar = SnackBar(content: Text('Press back again to exit'));
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //   // ---
        // },
        waitForSecondBackPress: 3, // default 2
        textStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        background: Colors.red,
        backgroundRadius: 30,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://www.couturia-apps.com/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
