import 'package:flutter/material.dart';
import 'package:todo_app/res/app_colors.dart';
import 'package:todo_app/res/text_style.dart';

class TaskEdit extends StatelessWidget {
  static const String routeName = "TaskEdit";

  const TaskEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("To Do List"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Edit Task",
                    style: poppins18Bold(),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    maxLines: 4,
                    minLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Details',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select time",
                      style: poppins18Bold(),
                    ),
                  ),
                  const SizedBox(
                    height: 115,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColors.blue),
                    ),
                    child: Text(
                      "Save Changes",
                      style: poppins18Bold(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
