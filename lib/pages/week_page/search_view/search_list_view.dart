import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../api.dart';
import '../timetable_tile.dart';

extension DateWeekExtensions on DateTime {
  int get isoWeekOfYear {
    // Get the monday of week 1
    final DateTime mondayWeek1 = _isoWeek1Monday();

    if (isBefore(mondayWeek1)) {
      return DateTime(year - 1, 12, 31).isoWeekOfYear;
    }

    final int ordinalWeek1Monday = mondayWeek1.ordinalDate();
    final int ordinal = ordinalDate();

    int diffInDays = ordinal - ordinalWeek1Monday;
    if (year > mondayWeek1.year) {
      diffInDays += 365;
      if (isLeapYear && DateTime(year, 2, 29).isBefore(this)) {
        diffInDays += 1;
      }
    }
    int week = (diffInDays ~/ 7) + 1;
    if (week == 53 && weekday < DateTime.thursday) {
      return 1;
    }
    return week;
  }

  int ordinalDate() {
    final DAYS_IN_MONTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    final monthsBefore = DAYS_IN_MONTH.getRange(0, month - 1);

    int days = monthsBefore.length > 0
        ? monthsBefore.reduce((value, element) => value + element)
        : 0;

    if (month > 2 && isLeapYear) {
      days += 1;
    }

    return days + day;
  }

  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  DateTime _isoWeek1Monday() {
    final jan4 = DateTime(year, 1, 4); // Jan 4 is always in week 1

    return DateTime(
      jan4.year,
      jan4.month,
      jan4.day - jan4.weekday + 1,
    );
  }
}

class SearchListView extends StatefulWidget {
  String date;
  String firstName;
  String lastName;
  String middleName;
  SearchListView(
      {Key? key,
      required this.date,
      required this.firstName,
      required this.lastName,
      required this.middleName})
      : super(key: key);

  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  String s = '';
  String dayName = '';
  String lessonTime = '';
  List<String> timetableList = [];

  Future<void> _getTimeTableListApi() async {
    print("${widget.firstName}${widget.lastName}");
    timetableList.clear();
    var data = json.decode((await http.get(Uri.parse(
            "http://89.208.221.228/api/timetables?teacher.firstName=${widget.firstName}&teacher.lastName=${widget.lastName}&teacher.middleName=${widget.middleName}")))
        .body);
    print(data);
    TimeTables timeTable = TimeTables.fromJson(data);
    //await service.cancelAll();
    for (var i in timeTable.timetables) {
      if (i.dayNumber == 1) {
        dayName = 'пн';
      }
      if (i.dayNumber == 2) {
        dayName = 'вт';
      }
      if (i.dayNumber == 3) {
        dayName = 'ср';
      }
      if (i.dayNumber == 4) {
        dayName = 'чт';
      }
      if (i.dayNumber == 5) {
        dayName = 'пт';
      }
      if (i.lessonNumber == 1) {
        lessonTime = '8:30 - 9:50';
      }
      if (i.lessonNumber == 2) {
        lessonTime = '10:05 - 11:25';
      }
      if (i.lessonNumber == 3) {
        lessonTime = '11:40 - 13:00';
      }
      if (i.lessonNumber == 4) {
        lessonTime = '13:45 - 15:05';
      }
      if (i.lessonNumber == 5) {
        lessonTime = '15:20 - 16:40';
      }
      if (i.lessonNumber == 6) {
        lessonTime = '16:55 - 18:15 ';
      }
      if (i.lessonNumber == 7) {
        lessonTime = '18:30 - 19:50';
      }
      if (i.lessonNumber == 8) {
        lessonTime = '20:05 - 21:25';
      }
      widget.date;
      var date = DateTime.now();
      if (i.weekParity == 1) {
        if (i.dayNumber == 1) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 8, 29, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 8, 29, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 8, 29, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 8, 29, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 8, 29, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 8, 29, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 8, 29, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 8, 29, 20);
          }
        }
        if (i.dayNumber == 2) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 8, 30, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 8, 30, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 8, 30, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 8, 30, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 8, 30, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 8, 30, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 8, 30, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 8, 30, 20);
          }
        }
        if (i.dayNumber == 3) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 8, 31, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 8, 31, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 8, 31, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 8, 31, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 8, 31, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 8, 31, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 8, 31, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 8, 31, 20);
          }
        }
        if (i.dayNumber == 4) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 1, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 1, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 1, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 1, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 1, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 1, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 1, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 1, 20);
          }
        }
        if (i.dayNumber == 5) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 2, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 2, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 2, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 2, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 2, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 2, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 2, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 2, 20);
          }
        }
      }
      if (i.weekParity == 2) {
        if (i.dayNumber == 1) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 5, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 5, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 5, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 5, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 5, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 5, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 5, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 5, 20);
          }
        }
        if (i.dayNumber == 2) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 6, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 6, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 6, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 6, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 6, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 6, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 6, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 6, 20);
          }
        }
        if (i.dayNumber == 3) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 7, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 7, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 7, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 7, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 7, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 7, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 7, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 7, 20);
          }
        }
        if (i.dayNumber == 4) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 8, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 8, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 8, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 8, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 8, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 8, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 8, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 8, 20);
          }
        }
        if (i.dayNumber == 5) {
          if (i.lessonNumber == 1) {
            date = DateTime(2022, 9, 9, 8, 25);
          }
          if (i.lessonNumber == 2) {
            date = DateTime(2022, 9, 9, 10);
          }
          if (i.lessonNumber == 3) {
            date = DateTime(2022, 9, 9, 11, 35);
          }
          if (i.lessonNumber == 4) {
            date = DateTime(2022, 9, 9, 13, 30);
          }
          if (i.lessonNumber == 5) {
            date = DateTime(2022, 9, 9, 15, 15);
          }
          if (i.lessonNumber == 6) {
            date = DateTime(2022, 9, 9, 16, 50);
          }
          if (i.lessonNumber == 7) {
            date = DateTime(2022, 9, 9, 18, 25);
          }
          if (i.lessonNumber == 8) {
            date = DateTime(2022, 9, 9, 20);
          }
        }
      }
      s = '${i.lesson[0].type},${i.lesson[0].name}, ${i.teacher[0].lastName} ${i.teacher[0].firstName} ${i.teacher[0].middleName},${i.location[0].number},$lessonTime,$dayName,${i.weekParity}';
      timetableList.add(s);
    }

    setState(() {});
  }

  Future<void> getList() async {
    setState(() {
    });
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getList();
    int weeknum = 0;
    var selectedDate = widget.date;
    var _selectedDate = selectedDate.characters.take(10).toString().split('-');
    if ((DateTime(int.parse(_selectedDate[0]), int.parse(_selectedDate[1]),
                        int.parse(_selectedDate[2]))
                    .isoWeekOfYear -
                DateTime(2023, 1, 1).isoWeekOfYear) %
            2 ==
        0) {
      weeknum = 1;
    } else {
      weeknum = 2;
    }
    String dayname = DateFormat.E('ru').format(DateTime(
        int.parse(_selectedDate[0]),
        int.parse(_selectedDate[1]),
        int.parse(_selectedDate[2])));

    List<String> type = [];
    List<String> lesson = [];
    List<String> theacher = [];
    List<String> cabinet = [];
    List<String> lesson_number = [];
    for (String i in timetableList) {
      if (i.split(',')[5] == dayname && i.split(',')[6] == weeknum.toString()) {
        type.add(i.split(",")[0]);
        lesson.add(i.split(",")[1]);
        theacher.add(i.split(",")[2]);
        cabinet.add(i.split(",")[3]);
        lesson_number.add(i.split(",")[4]);
      }
    }
    return RefreshIndicator(
      onRefresh: _getTimeTableListApi,
      child: ListView.builder(
        itemCount: lesson.length,
        itemBuilder: (BuildContext context, int index) {
          return TimetableTile(
            type: type[index],
            lesson: lesson[index],
            theacher: theacher[index],
            cabinet: cabinet[index],
            lesson_number: lesson_number[index],
          );
        },
      ),
    );
  }


}
