import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/pages/week_page/search.dart';
import 'package:loginpage_tz3/pages/week_page/timetable_list_view.dart';


class WeekPage extends StatefulWidget {
  @override
  _WeekPageState createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>SearchPage()));
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue.shade900,
            Colors.blue.shade500,
            Colors.blue.shade400,
          ]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Расписание',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ),
              CalendarTimeline(
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
                monthColor: Colors.white70,
                dayColor: Colors.white70,
                dayNameColor: Colors.white70,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.blue.shade700,
                dotsColor: Colors.white70,
                locale: 'ru',
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                boxShadow: [BoxShadow(blurRadius: 10.0)]),
                            child:
                                TimetableListView(date: _selectedDate.toString()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
