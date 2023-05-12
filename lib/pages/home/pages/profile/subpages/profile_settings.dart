import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/subpages/notification_page.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/session_results/session_res.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileBackground,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () async {
            // Navigator.push(context,
            //   MaterialPageRoute(builder: (context) => const ProfilePage2(), ));
            // Navigator.push(context,
            //   MaterialPageRoute(builder: (context) => const HomePage()));
            Navigator.pop(context);
          },
          color: profileBackground,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        flexibleSpace: const SafeArea(
          child: Center(
            child: Text(
              "Настройки",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(27, 54, 93, 1)),
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   bottomOpacity: 0.0,
      //   elevation: 0.0,
      //   backgroundColor: profileBackground,
      //   leading: BackButton(
      //     onPressed: () async {
      //       // Navigator.push(context,
      //       //   MaterialPageRoute(builder: (context) => const ProfilePage2(), ));
      //       // Navigator.push(context,
      //       //   MaterialPageRoute(builder: (context) => const HomePage()));
      //       Navigator.pop(context);
      //     },
      //     color: Colors.white,
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     "Настройки",
      //     style: TextStyle(fontSize: 28, color: Colors.white),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          // ListTile(
          //   leading: Icon(Icons.lock_reset, color: Colors.grey),
          //   title: Text("Сменить пароль", style: TextStyle(fontSize: 20, color: Colors.white),),
          //   trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          // ),
          MenuSettingsWidget(settingsIcon: Icons.lock, settingsLabel: "Сменить пароль", onPress: () {}, textColor: profileBackground,),
          SizedBox(height: 10),
          MenuSettingsWidget(settingsIcon: Icons.language, settingsLabel: "Язык", onPress: () {},
            textColor: profileBackground,
          ),
          SizedBox(height: 10),
          MenuSettingsWidget(settingsIcon: Icons.dark_mode_outlined, settingsLabel: "Тема", onPress: () {},
            textColor: profileBackground,
          ),
          SizedBox(height: 10),
          MenuSettingsWidget(settingsIcon: Icons.notification_add, settingsLabel: "Уведомления", onPress: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotifyPage()));
          },
            textColor: profileBackground,
          ),
        ]),
      ),
    );
  }

}

class MenuSettingsWidget extends StatelessWidget {
  final IconData settingsIcon;
  final String settingsLabel;
  final bool endIcon;
  final void Function()? onPress;
  final Color? textColor;

  const MenuSettingsWidget({
    super.key,
    required this.settingsIcon,
    required this.settingsLabel,
    this.endIcon = true,
    required this.onPress,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      // height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
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
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            //color: profileBackground.withOpacity(0.1),
          ),
          child: Icon(settingsIcon, color: profileBackground),
        ),
        title: Text(settingsLabel,
            style: TextStyle(color: textColor, fontSize: 18)),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  //color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.arrow_forward_ios,
                    size: 18.0, color: Colors.grey),
              )
            : null,
      ),
    );
  }
}


