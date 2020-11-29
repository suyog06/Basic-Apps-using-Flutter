import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (checkBoxState) {
                  taskData.updateTask(task);
                },
                longPressCallBack: (){
                  taskData.deleteTask(task);
               },
              );
            },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
