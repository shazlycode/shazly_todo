import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazly_todo/models/task.dart';
import 'package:shazly_todo/screens/add_task_screen.dart';
import 'package:shazly_todo/widgets/taskslist.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlue,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "To Do Tasks",
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      SizedBox(width: 20.0, height: 100),
                      RotateAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: ["AWESOME", "OPTIMISTIC", "DIFFERENT"],
                        textStyle:
                            TextStyle(fontSize: 30.0, fontFamily: "Horizon"),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
//                  Text(
//                    "To Do",
//                    style: TextStyle(
//                        fontSize: 50,
//                        fontWeight: FontWeight.w700,
//                        color: Colors.white),
//                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${context.watch<TaskData>().tasks.length} Tasks",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [
    Task(name: "Bye milk"),
    Task(name: "By egg"),
    Task(name: "By 3agwa"),
    Task(name: "Bye milk"),
    Task(name: "By egg"),
    Task(name: "By 3agwa"),
  ];

  void addTask(String title) {
    tasks.add(Task(name: title));
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
