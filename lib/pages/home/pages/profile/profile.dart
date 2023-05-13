import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/home/home.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/session_results/session_res.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/subpages/profile_settings.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/session_results/session_res_teacher.dart';
import '../../../authorization/auth.dart';

String profile_name = "Георгий Ершов";
// List<String> nameSplit = profile_name.split("");
// String initials = "${nameSplit[0][0]}${nameSplit[1][0]}";
String initials = profile_name.isNotEmpty ? profile_name.trim().split(' ').map((e) => e[0]).join().toUpperCase() : "";
String profileAsset = '';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: profileBackground,
        //appBar: buildAppBar(context),
        body: Container(
          color: profileBackground,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: profileAsset != null && profileAsset.isNotEmpty
                          ? Image.asset(
                              profileAsset,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return _buildInitialsAvatar(initials);
                              },
                            )
                          : _buildInitialsAvatar(initials),
                    ),
                    SizedBox(
                      height: 10,
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('Георгий Ершов',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: profileBackground, fontSize: 18)),
                        ),
                        Center(
                          child: Text('21109843@edu.rut-miit.ru',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: profileBackground, fontSize: 18)),
                        ),
                        Center(
                          child: Text('УВП-211',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: profileBackground, fontSize: 18)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
                    // height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              children: [
                                // MenuProfileWidget(
                                //     profileIcon:
                                //         Icons.assignment_turned_in_outlined,
                                //     settingsName: 'Результаты сессий'),
                                // SizedBox(height: 10),
                                // MenuProfileWidget(
                                //     profileIcon: Icons.settings_outlined,
                                //     settingsName: "Настройки"),
                                // SizedBox(height: 10),
                                // MenuProfileWidget(
                                //     profileIcon: Icons.info_outlined,
                                //     settingsName: 'Помощь'),
                                // SizedBox(height: 10),
                                // MenuProfileWidget(
                                //     profileIcon: Icons.question_mark_outlined,
                                //     settingsName: 'О приложении'),
                                MenuProfileWidget(
                                  textColor: profileBackground,
                                  profileIcon:
                                      Icons.assignment_turned_in_outlined,
                                  settingsName: 'Результаты сессий',
                                  onPress: () {
                                    userType == 'student' ?
                                    //function checking users type
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResultsPage())):
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TeacherResultsPage()));
                                  },
                                ),
                                SizedBox(height: 10),
                                MenuProfileWidget(
                                  textColor: profileBackground,
                                  profileIcon: Icons.settings_outlined,
                                  settingsName: "Настройки",
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SettingsPage()));
                                  },
                                ),
                                SizedBox(height: 10),
                                MenuProfileWidget(
                                  textColor: profileBackground,
                                  profileIcon: Icons.info_outlined,
                                  settingsName: 'Помощь',
                                  onPress: () {},
                                ),
                                SizedBox(height: 10),
                                MenuProfileWidget(
                                  textColor: profileBackground,
                                  profileIcon: Icons.question_mark_outlined,
                                  settingsName: 'О приложении',
                                  onPress: () {},
                                ),
                                SizedBox(height: 10),
                                MenuProfileWidget(
                                    profileIcon: Icons.logout,
                                    settingsName: "Выйти",
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AuthPage()));
                                    },
                                    //textColor: Colors.red,
                                    endIcon: false),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   child: Divider(
                        //     thickness: 5,
                        //     color: Colors.grey.withOpacity(0.7),
                        //   ),
                        // ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: profileBackground,
      bottomOpacity: 0.0,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "Профиль",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

Widget _buildInitialsAvatar(String initials) {
  return CircleAvatar(
    backgroundColor: Colors.grey.withOpacity(0.7),
    radius: 50,
    child: Center(
      child: Text(
        initials,
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    ),
  );
}

class MenuProfileWidget extends StatelessWidget {
  final IconData profileIcon;
  final String settingsName;
  final bool endIcon;
  final void Function()? onPress;
  final Color? textColor;

  const MenuProfileWidget({
    super.key,
    required this.profileIcon,
    required this.settingsName,
    this.endIcon = true,
    required this.onPress,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight = screenHeight * 0.07;
    final double leadingIconSize = containerHeight * 0.8;
    final double trailingIconSize = containerHeight * 0.6;

    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(0),
      child: ListTile(
        dense: true,
        onTap: onPress,
        leading: Container(
          width: leadingIconSize,
          height: leadingIconSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            //color: profileBackground.withOpacity(0.1),
          ),
          child: Icon(profileIcon, color: profileBackground),
        ),
        title: Text(settingsName,
            style:
                TextStyle(color: textColor, fontSize: 20)),
        trailing: endIcon
            ? Container(
                width: trailingIconSize,
                height: trailingIconSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  //color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_forward_ios,
                    size: containerHeight * 0.3, color: Colors.grey),
              )
            : null,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     // height: 50,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       border: Border.all(
  //         color: Colors.grey.withOpacity(0.3),
  //         width: 2,
  //       ),
  //     ),
  //     padding: EdgeInsets.all(0),
  //     child: ListTile(
  //       dense: true,
  //       onTap: onPress,
  //       leading: Container(
  //         width: 30,
  //         height: 30,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(100),
  //           //color: profileBackground.withOpacity(0.1),
  //         ),
  //         child: Icon(profileIcon, color: profileBackground),
  //       ),
  //       title: Text(settingsName,
  //           style: TextStyle(color: textColor, fontSize: 18)),
  //       trailing: endIcon ? Container(
  //         width: 30,
  //         height: 30,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(100),
  //           //color: Colors.grey.withOpacity(0.1),
  //         ),
  //         child: const Icon(Icons.arrow_forward_ios,
  //             size: 18.0, color: Colors.grey),
  //       ) : null,
  //     ),
  //   );
  // }
}
