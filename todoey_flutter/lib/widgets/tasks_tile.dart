import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final Function checkBoxCallBack;
  final Function longPressCallBack;
  final bool isChecked;
  final String taskTitle;
  TasksTile({this.isChecked, this.taskTitle, this.checkBoxCallBack, this.longPressCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(taskTitle, style: TextStyle(fontSize: 20.0,color: Colors.white, decoration: isChecked ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(
        onChanged: checkBoxCallBack,
        value: isChecked,
        activeColor: Colors.teal,
        checkColor: Colors.white,
      ),
    );
  }
}