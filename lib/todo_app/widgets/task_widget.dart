import 'package:flutter/material.dart';
import 'package:state_managment/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  Function fun;
  Function removeFunction;
  Task task;

  TaskWidget(this.task, this.fun, this.removeFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: task.isCompleted ? Colors.greenAccent : Colors.teal.shade50,
          borderRadius: BorderRadius.circular(2)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: CheckboxListTile(
        title: Text(task.title),
        value: task.isCompleted,
        onChanged: (v) {
          fun(task);
        },
        secondary: IconButton(
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Delete Task"),
                  content: const Text("Are You Sure To Delete This Task ?"),
                  actions: [
                    TextButton(
                      child: const Text("No"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: const Text("Yes"),
                      onPressed: () {
                        removeFunction(task);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
