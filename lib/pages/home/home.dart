import 'package:flutter/material.dart';
import 'package:loginpage_tz3/bd/hive_service.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/authorization/auth.dart';
import 'package:loginpage_tz3/pages/home/pages/audiences/audiences.dart';
import 'package:loginpage_tz3/pages/home/pages/main/main_page.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/profile.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/tasks.dart';
import 'package:loginpage_tz3/pages/week_page/week.dart';

final navigationBarItems = '';
String userType = '';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// class _HomePageState extends State<HomePage> {
//   int currentPageIndex = 0;
//   final h = HiveService();

//   String userType = 'teacher';

//   @override
//   void initState() {
//     super.initState();
//     // Call findUserType function and set the userType variable when the widget is initialized
//     h.findUserType(value_tab2).then((value) {
//       setState(() {
//         userType = value;
//       });
//     });
//   }
//   //final userType = await h.findUserType(value_tab2);
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         bottomNavigationBar: BottomNavigationBarTheme(
//           data: const BottomNavigationBarThemeData(
//             unselectedIconTheme: IconThemeData(
//               size: 27,
//             ),
//             selectedIconTheme: IconThemeData(
//               size: 27,
//             ),
//             showUnselectedLabels: true,
//             backgroundColor: backgroundColor,
//             selectedItemColor: colorSelected,
//             unselectedItemColor: colorUnSelected,
//             selectedLabelStyle: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//             ),
//             unselectedLabelStyle:  TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//             ),
//             type: BottomNavigationBarType.fixed,
//           ),
//           child: userType == 'teacher' ?
//           BottomNavigationBar(
//             currentIndex: currentPageIndex,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Главная',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.access_time),
//                 label: 'Расписание',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.format_list_bulleted),
//                 label: 'Задачи',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.school),
//                 label: 'Аудитории',
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person), label: "Профиль")
//             ],
//             onTap: (index) {
//               setState(() {
//                 currentPageIndex = index;
//               });
//             },
//           ) :
//           BottomNavigationBar(
//                     currentIndex: currentPageIndex,
//                     items: const [
//                       BottomNavigationBarItem(
//                         icon: Icon(Icons.home),
//                         label: 'Главная',
//                       ),
//                       BottomNavigationBarItem(
//                         icon: Icon(Icons.access_time),
//                         label: 'Расписание',
//                       ),
//                       BottomNavigationBarItem(
//                         icon: Icon(Icons.format_list_bulleted),
//                         label: 'Задачи',
//                       ),
//                       // BottomNavigationBarItem(
//                       //   icon: Icon(Icons.school),
//                       //   label: 'Аудитории',
//                       // ),
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.person), label: "Профиль")
//                     ],
//                     onTap: (index) {
//                       setState(() {
//                         currentPageIndex = index;
//                       });
//                     },
//                   )
//         ),
//         body: <Widget>[
//           Container(
//             color: colorHome,
//             alignment: Alignment.center,
//             child: MainPage(),
//           ),
//           Container(
//             color: colorSchedule,
//             alignment: Alignment.center,
//             child: WeekPage(),
//           ),
//           Container(
//             color: colorTasks,
//             alignment: Alignment.center,
//             child: TaskPage(),
//           ),
//           Container(
//             color: colorAudiences,
//             alignment: Alignment.center,
//             child: AudiencesPage(),
//           ),
//           Container(
//             color: colorProfile,
//             alignment: Alignment.center,
//             child: ProfilePage(),
//           ),
//         ][currentPageIndex],
//       ),
//     );
//   }
// }

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final h = HiveService();
  

  Future<void> _getUserType() async {
    //print(value_tab2);
    userType = await h.findUserType(value_tab2);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    //_getUserType();
  }

  @override
  Widget build(BuildContext context) {
    _getUserType();
    //print(userType + "u");
    // Conditionally define navigation bars based on the userType variable
    final navigationBarItems2 = userType == 'teacher'
        ? const [
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
              icon: Icon(Icons.person),
              label: "Профиль",
            ),
          ]
        : const [
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
              icon: Icon(Icons.person),
              label: "Профиль",
            ),
          ];
    //print(navigationBarItems2);
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
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              type: BottomNavigationBarType.fixed,
            ),
            child: BottomNavigationBar(
              currentIndex: currentPageIndex,
              items: navigationBarItems2,
              onTap: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
          body: navigationBarItems2.length == 5
              ? <Widget>[
                  Container(
                    color: colorHome,
                    alignment: Alignment.center,
                    child: MainPage(),
                  ),
                  Container(
                    color: colorSchedule,
                    alignment: Alignment.center,
                    child: WeekPage(),
                  ),
                  Container(
                    color: colorTasks,
                    alignment: Alignment.center,
                    child: TaskPage(),
                  ),
                  Container(
                    color: colorAudiences,
                    alignment: Alignment.center,
                    child: AudiencesPage(),
                  ),
                  Container(
                    color: colorProfile,
                    alignment: Alignment.center,
                    child: ProfilePage(),
                  ),
                ][currentPageIndex]
              : <Widget>[
                  Container(
                    color: colorHome,
                    alignment: Alignment.center,
                    child: MainPage(),
                  ),
                  Container(
                    color: colorSchedule,
                    alignment: Alignment.center,
                    child: WeekPage(),
                  ),
                  Container(
                    color: colorTasks,
                    alignment: Alignment.center,
                    child: TaskPage(),
                  ),
                  Container(
                    color: colorProfile,
                    alignment: Alignment.center,
                    child: ProfilePage(),
                  ),
                ][currentPageIndex]),
    );
  }
}
