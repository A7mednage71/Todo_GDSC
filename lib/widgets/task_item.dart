import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/res/app_colors.dart';
import 'package:todo_app/res/text_style.dart';
import 'package:todo_app/screens/task_edit.dart';
import 'package:todo_app/widgets/showdialog.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 40),
      child: Slidable(
        startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.4,
            children: [
              SlidableAction(
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        text: 'are you sure you want to delete this task?',
                        cancelonPress: () {
                          Navigator.of(context).pop();
                        },
                        oKonPress: () {},
                      );
                    },
                  );
                },
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              )
            ]),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, TaskEdit.routeName);
            },
            label: 'Edit',
            icon: Icons.edit,
            backgroundColor: Colors.greenAccent,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 20,
                ),
                height: 65,
                width: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isDone ? AppColors.lightGreen : AppColors.blue),
              ),
              Column(
                children: [
                  Text(
                    "Task",
                    style: poppins18Bold(),
                  ),
                  const Row(
                    children: [Icon(Icons.lock_clock), Text("10:30 AM")],
                  )
                ],
              ),
              const Spacer(),
              if (isDone == false)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isDone = true;
                      });
                    },
                    child: Container(
                      width: 69,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 42,
                  ),
                  child: Text(
                    "Done!",
                    style: poppins22Bold(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
