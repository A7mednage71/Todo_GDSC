import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/widgets/task_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
        ),
        body: Consumer<TaskProvider>(
          builder: (context, provider, child) {
            List<TaskModel> tasks =  provider.getAlltasks();
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  taskModel: tasks[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Calender extends StatelessWidget {
  const Calender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        toggleViewType: true,
        headerMonthElevation: 10,
        headerMonthShadowColor: Colors.black26,
        headerMonthBackColor: Colors.transparent,
      ),
      dayOptions: DayOptions(
        compactMode: true,
        weekDaySelectedColor: const Color(0xff3AC3E2),
        disableDaysBeforeNow: true,
      ),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: const Color(0xff3AC3E2),
          headerTextColor: Colors.black),
      onChangeDateTime: (datetime) {
        print(datetime.getDate());
      },
    );
  }
}
