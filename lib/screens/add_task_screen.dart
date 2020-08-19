import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazly_todo/screens/tasksscreen.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 20, right: 30, left: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 40),
            ),
            TextField(
              autofocus: true,
              onChanged: (value) {
                taskTitle = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  context.read<TaskData>().addTask(taskTitle);
                });
                Navigator.pop(context);
              },
              child: Text(
                "Add Task",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.red, blurRadius: 8, offset: Offset(2, 3))
                ]),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
