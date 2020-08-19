import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazly_todo/screens/tasksscreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => TaskData(),
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
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}
