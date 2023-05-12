import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  bool _switchValue = false;
  bool _switchValue2 = false;
  late bool value;
  late bool value2;

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
              "Уведомления",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(27, 54, 93, 1)),
            ),
          ),
        ),
      ),
    body: Container(
      child: Column(children: [
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 2,
                ),
              ),
          child: ListTile(
              leading: Text("Вкл/Выкл Уведомления", style: TextStyle(color: profileBackground, fontSize: 18),),
              trailing: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  }),
            ),
        ),],
      ),
    ),
    );
  }
}
