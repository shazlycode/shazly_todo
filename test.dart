import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Data(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(context.watch<Data>().title),
        ),
        body: Container(
          child: Center(
            child: Text(context.watch<Data>().title),
          ),
        ),
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String title = "Ahmed Say Alllam";
}
