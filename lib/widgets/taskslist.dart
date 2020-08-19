import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazly_todo/screens/tasksscreen.dart';
import 'package:shazly_todo/widgets/taskstile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var task = context.watch<TaskData>().tasks[index];
        return TaskTile(
          deleteTask: () {
            context.read<TaskData>().deleteTask(task);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Row(
                children: <Widget>[
                  Flexible(child: Icon(Icons.delete_forever)),
                  Text("${task.name} has been deleted")
                ],
              ),
              elevation: 5,
              backgroundColor: Colors.lightBlue,
            ));
          },
          name: context.watch<TaskData>().tasks[index].name,
          isDone: Provider.of<TaskData>(context).tasks[index].isDone,
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
