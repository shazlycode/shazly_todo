import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String name;
  final bool isDone;
  final Function deleteTask;
  TaskTile({this.name, this.isDone, this.deleteTask});
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkCallBack(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.deleteTask,
      title: Text(
        widget.name,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: CheckBox(
        isDone: isChecked,
        fun: checkCallBack,
      ),
    );
  }
}

class CheckBox extends StatelessWidget {
  final Function fun;
  final bool isDone;
  CheckBox({this.isDone, this.fun});

  Widget build(BuildContext context) {
    return Checkbox(
      value: isDone,
      onChanged: fun,
    );
  }
}
