import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/themes/text_themes.dart';

import '../addTasks/addTasks.dart';

class TodayTasks extends StatefulWidget {
  const TodayTasks({super.key});

  @override
  State<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 54, 93, 1),
      appBar: _appBarSettings(context),
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
                  _addTaskBar(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_appBarSettings(BuildContext context) {
  return AppBar(
    centerTitle: true,
    foregroundColor: Color.fromRGBO(27, 54, 93, 1),
    elevation: 0,
    leading: const BackButton(),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
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

_addTaskBar(BuildContext context) {
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
              Text(
                DateFormat.yMMMMd('ru_RU').format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Сегодня",
                style: headingStyle,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTasksPage()));
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
