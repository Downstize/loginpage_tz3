import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';

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
                icon: Icon(Icons.calendar_today),
                label: 'Расписание',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Задания',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Чаты',
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
            child: const Text('There would be a Tasks Page here'),
          ),
          Container(
            color: colorMessenger,
            alignment: Alignment.center,
            child: const Text('There would be a Messenger Page here'),
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
