import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/screens/settings.dart';
import 'package:todo_app/screens/tasks.dart';
import 'package:todo_app/widgets/AddTask.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List tabs = [
    const TasksScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[index],
        bottomNavigationBar: BottomAppBar(
          notchMargin: 14,
          height: 85,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
              currentIndex: index,
              onTap: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: '',
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return ChangeNotifierProvider<TaskProvider>(
                    create: (context) => TaskProvider(),
                    child: const AddTask(),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
