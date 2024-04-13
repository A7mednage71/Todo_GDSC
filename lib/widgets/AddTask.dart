import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/task_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    super.key,
  });

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode mode = AutovalidateMode.always;
  String? task;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          left: 10,
          right: 10,
          top: 10),
      child: Form(
        key: key,
        autovalidateMode: mode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              minLines: 2,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Task",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Task cannot be empty';
                }
                if (value.length < 3 || value.length > 15) {
                  return 'task must be between 3 and 15 characters';
                }
                return null;
              },
              onChanged: (value) {},
              onSaved: (newValue) {
                task = newValue;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                "Add Task",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();

                  var newtask = TaskModel(
                    title: "",
                    description: task!,
                    time: "10:00 Bm",
                  );
                  provider.addTask(model: newtask);
                  provider.getAlltasks();
                  Navigator.of(context).pop();
                } else {}
              },
            )
          ],
        ),
      ),
    );
  }
}
