import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
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
      backgroundColor: Color.fromRGBO(27, 54, 93, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        flexibleSpace: SafeArea(
          child: Center(
            child: const Text(
              "Рассписание",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color:  Color.fromRGBO(27, 54, 93, 1)),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>SearchPage()));
        },
        child: Icon(Icons.search,color: Colors.white,),
        backgroundColor: Color.fromRGBO(27, 54, 93, 1),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: profileBackground,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
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
                dayNameColor: Color.fromRGBO(27, 54, 93, 1),
                activeDayColor: Color.fromRGBO(27, 54, 93, 1),
                activeBackgroundDayColor: Colors.white,
                dotsColor: Color.fromRGBO(27, 54, 93, 1),
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
                                    topRight: Radius.circular(20)),),
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
