import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/home/pages/profile/session_res.dart';

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
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: profileBackground,
        leading: BackButton(
          onPressed: () async {
            // Navigator.push(context,
            //   MaterialPageRoute(builder: (context) => const ProfilePage2(), ));
            // Navigator.push(context,
            //   MaterialPageRoute(builder: (context) => const HomePage()));
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "Настройки",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.lock_reset, color: Colors.grey),
            title: Text("Сменить пароль", style: TextStyle(fontSize: 20, color: Colors.white),),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          )
        ]),
      ),
    );
  }
}
