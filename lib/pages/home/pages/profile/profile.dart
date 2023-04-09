import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';

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
    return Scaffold(
      backgroundColor: profileBackground,
      appBar: buildAppBar(context),
      body: Container(
        color: profileBackground,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
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
                                color: profileBackground, fontSize: 18)),
                      ),
                      Center(
                        child: Text('21109843@edu.rut-miit.ru',
                            style: TextStyle(
                                color: profileBackground, fontSize: 18)),
                      ),
                      Center(
                        child: Text('УВП-211',
                            style: TextStyle(
                                color: profileBackground, fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: Container(
                  // height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: Column(
                            children: [
                              MenuProfileWidget(
                                  profileIcon:
                                      Icons.assignment_turned_in_outlined,
                                  settingsName: 'Результаты сессий'),
                              SizedBox(height: 10),
                              MenuProfileWidget(
                                  profileIcon: Icons.settings_outlined,
                                  settingsName: "Настройки"),
                              SizedBox(height: 10),
                              MenuProfileWidget(
                                  profileIcon: Icons.info_outlined,
                                  settingsName: 'Помощь'),
                              SizedBox(height: 10),
                              MenuProfileWidget(
                                  profileIcon: Icons.question_mark_outlined,
                                  settingsName: 'О приложении'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: profileBackground,
      bottomOpacity: 0.0,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "Профиль",
        style: TextStyle(fontSize: 24),
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

  const MenuProfileWidget({
    super.key,
    required this.profileIcon,
    required this.settingsName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
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
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            //color: profileBackground.withOpacity(0.1),
          ),
          child: Icon(profileIcon, color: profileBackground),
        ),
        title: Text(settingsName,
            style: TextStyle(color: profileBackground, fontSize: 18)),
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            //color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(Icons.arrow_forward_ios,
              size: 18.0, color: Colors.grey),
        ),
      ),
    );
  }
}
