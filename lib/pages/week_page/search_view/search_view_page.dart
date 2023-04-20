import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/pages/week_page/search_view/search_list_view.dart';


class SearchViewPage extends StatefulWidget {
  String id;
  String firstName;
  String lastName;
  String middleName;
  String email;
  String description;
  String department;
  SearchViewPage(
      {Key? key,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.email,
      required this.description,
      required this.department})
      : super(key: key);

  @override
  _SearchViewPageState createState() => _SearchViewPageState();
}

class _SearchViewPageState extends State<SearchViewPage> {
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade500,
          Colors.blue.shade400,
        ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
              '${widget.lastName} ${widget.firstName} ${widget.middleName}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              CalendarTimeline(
                showYears: false,
                initialDate: _selectedDate,
                firstDate: DateTime(
                  2022,
                  9,
                  1,
                ),
                lastDate: DateTime(
                  2022,
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
                  child: SearchListView(
                    date: _selectedDate.toString(),
                    firstName: widget.firstName,
                    lastName: widget.lastName,
                    middleName: widget.middleName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
