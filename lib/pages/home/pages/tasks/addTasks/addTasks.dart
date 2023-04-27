import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginpage_tz3/themes/text_themes.dart';
import 'package:loginpage_tz3/widgets/input_field.dart';

import '../../../../../main.dart';

class AddTasksPage extends StatefulWidget {
  const AddTasksPage({super.key});

  @override
  State<AddTasksPage> createState() => _AddTasksPageState();
}

class _AddTasksPageState extends State<AddTasksPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "21:30";
  String _startTime = DateFormat.Hm().format(DateTime.now()).toString();
  DateTime _time =
      DateTime.now().subtract(Duration(minutes: DateTime.now().minute));
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
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Добавление задачи", style: headingStyle),
                      const InputFieldWidget(
                          title: "Заголовок", hint: "Введите заголовок"),
                      const InputFieldWidget(
                          title: "Описание задачи", hint: "Введите описание"),
                      InputFieldWidget(
                        title: "Дата",
                        hint: DateFormat.yMd("ru_RU").format(_selectedDate),
                        widget: IconButton(
                            onPressed: () {
                              _getDateFromUser();
                            },
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                            )),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InputFieldWidget(
                            title: "Начальное время",
                            hint: _startTime,
                            widget: IconButton(
                                onPressed: () {
                                  _getStartTimeFromUser();
                                },
                                icon: const Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                )),
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                              child: InputFieldWidget(
                            title: "Конечное время",
                            hint: _endTime,
                            widget: IconButton(
                                onPressed: () {
                                  _getEndTimeFromUser();
                                },
                                icon: const Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                )),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getDateFromUser() async {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 190,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                        // key: UniqueKey(),
                        mode: CupertinoDatePickerMode.date,
                        minimumYear: 2023,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedDate = val;
                              print(_selectedDate);
                            });
                          } else {
                            print("что-то пошло не так");
                          }
                        }),
                  ),
                ],
              ),
            ));
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
          "Запланировано",
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

  void _getStartTimeFromUser() {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 190,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                        //key: UniqueKey(),
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        initialDateTime: _time,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _startTime =
                                '${val.hour.toString().padLeft(2, '0')}:${val.minute.toString().padLeft(2, '0')}';
                          });
                        }),
                  ),
                ],
              ),
            ));
  }

  void _getEndTimeFromUser() {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 190,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                        // key: UniqueKey(),
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        initialDateTime: _time,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _endTime =
                                '${val.hour.toString().padLeft(2, '0')}:${val.minute.toString().padLeft(2, '0')}';
                          });
                        }),
                  ),
                ],
              ),
            ));
  }
}
