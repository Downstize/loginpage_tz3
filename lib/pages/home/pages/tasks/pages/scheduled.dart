import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/addTasks/addTasks.dart';
import 'package:loginpage_tz3/themes/text_themes.dart';
import '../../../../../main.dart';

class ScheduledTasks extends StatefulWidget {
  const ScheduledTasks({super.key});

  @override
  State<ScheduledTasks> createState() => _ScheduledTasksState();
}

DateTime _selectedDate = DateTime.now();

class _ScheduledTasksState extends State<ScheduledTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 54, 93, 1),
      appBar: _appBarSettings(),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _addTaskBar(),
                  _addDateBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _appBarSettings() {
    return AppBar(
      foregroundColor: Color.fromRGBO(27, 54, 93, 1),
      elevation: 0,
      leading: const BackButton(),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Задачи",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(27, 54, 93, 1),
          ),
        ),
      ),
      titleSpacing: 0,
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd('ru_RU').format(DateTime.now()),
                    style: subHeadingStyle),
                Text(
                  "Сегодня",
                  style: headingStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddTasksPage()));
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: containersColorOnTaskPage),
              child: const Center(
                  child: Text(
                "+ Добавить задачу",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
            ),
          )
        ],
      ),
    );
  }

  _addDateBar() {
    // return Container(
    //   margin: const EdgeInsets.only(top: 20, left: 20),
    //   child: DatePicker(
    //     DateTime.now(),
    //     height: 100,
    //     width: 80,
    //     initialSelectedDate: DateTime.now(),
    //     selectionColor: containersColorOnTaskPage,
    //     selectedTextColor: Colors.white,
    //     monthTextStyle: monthTextStyle,
    //     dateTextStyle: dateTextStyle,
    //     dayTextStyle: dayTextStyle,
    //     locale: "ru_RU",
    //     onDateChange: (date) {
    //       _selectedDate = date;
    //     },
    //   ),
    // );
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: CalendarTimeline(
        showYears: false,
        initialDate: _selectedDate,
        firstDate: DateTime(
          2023,
          1,
          1,
        ),
        lastDate: DateTime(
          2023,
          12,
          31,
        ),
        onDateSelected: (date) => setState(() => _selectedDate = date),
        leftMargin: 20,
        monthColor: containersColorOnTaskPage,
        dayColor: containersColorOnTaskPage,
        dayNameColor: Colors.white,
        activeDayColor: Colors.white,
        activeBackgroundDayColor: containersColorOnTaskPage,
        dotsColor: Colors.white,
        locale: 'ru',
      ),
    );
  }
}
