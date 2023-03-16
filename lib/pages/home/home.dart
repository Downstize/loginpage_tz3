import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarTheme(
          data: const BottomNavigationBarThemeData(
            unselectedIconTheme: IconThemeData(
              size: 27,
            ),
            selectedIconTheme: IconThemeData(
              size: 27,
            ),
            showUnselectedLabels: true,
            backgroundColor: backgroundColor,
            selectedItemColor: colorSelected,
            unselectedItemColor: colorUnSelected,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle:  TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            type: BottomNavigationBarType.fixed,
          ),
          child: BottomNavigationBar(
            currentIndex: currentPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: 'Расписание',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: 'Задачи',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Аудитории',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Профиль")
            ],
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),
        body: <Widget>[
          Container(
            color: colorHome,
            alignment: Alignment.center,
            child: const Text('There would be a Main Page here'),
          ),
          Container(
            color: colorSchedule,
            alignment: Alignment.center,
            child: const Text('There would be a Schedule Page here'),
          ),
          Container(
            color: colorTasks,
            alignment: Alignment.center,
            child: TaskPage(),
          ),
          Container(
            color: colorAudiences,
            alignment: Alignment.center,
            child: const Text('There would be a Audiences Page here'),
          ),
          Container(
            color: colorProfile,
            alignment: Alignment.center,
            child: const Text('There would be a Profile Page here'),
          ),
        ][currentPageIndex],
      ),
    );
  }
}
