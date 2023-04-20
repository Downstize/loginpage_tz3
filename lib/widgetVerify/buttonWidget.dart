import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/authorization/auth.dart';
import 'package:loginpage_tz3/pages/forgotPassword/forgotpassword.dart';
import 'package:loginpage_tz3/pages/home/home.dart';
import 'package:loginpage_tz3/pages/registration/registration.dart';

import '../bd/hive_service.dart';

class Buttonregistrate extends StatefulWidget {
  final bool active;
  const Buttonregistrate({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<Buttonregistrate> createState() => _ButtonregistrateState();
}

final formKey = GlobalKey<FormState>();

class _ButtonregistrateState extends State<Buttonregistrate> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: authButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          disabledForegroundColor: Colors.grey,
        ),
        onPressed: widget.active
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewPassRegistrationPage()));
              }
            : null,
        child: const SizedBox(
          width: 330.0,
          height: 50.0,
          child: Center(
            child: Text(
              'Отправить',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonRegConfirm extends StatefulWidget {
  final bool active;
  const ButtonRegConfirm({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<ButtonRegConfirm> createState() => _ButtonRegConfirmState();
}

class _ButtonRegConfirmState extends State<ButtonRegConfirm> {
  final formKey = GlobalKey<FormState>();
  final h  = HiveService();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: authButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          disabledForegroundColor: Colors.grey,
        ),
        onPressed: widget.active
            ? () {
                h.addUser(value_tab, tabelNumber, rePassword);
                tabelNumber = "";
                value_tab = "";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            : null,
        child: const SizedBox(
          width: 330.0,
          height: 50.0,
          child: Center(
            child: Text(
              'Подтвердить',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonVerificationForgotPass extends StatefulWidget {
  final bool active;
  const ButtonVerificationForgotPass({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<ButtonVerificationForgotPass> createState() =>
      _ButtonVerificationForgotPassState();
}

class _ButtonVerificationForgotPassState
    extends State<ButtonVerificationForgotPass> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: authButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          disabledForegroundColor: Colors.grey,
        ),
        onPressed: widget.active
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NewPassForgotPasswordPage()));
              }
            : null,
        child: const SizedBox(
          width: 330.0,
          height: 50.0,
          child: Center(
            child: Text(
              'Отправить',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonForgotConfirm extends StatefulWidget {
  final bool active;
  const ButtonForgotConfirm({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<ButtonForgotConfirm> createState() => _ButtonForgotConfirmState();
}

class _ButtonForgotConfirmState extends State<ButtonForgotConfirm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: authButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          disabledForegroundColor: Colors.grey,
        ),
        onPressed: widget.active
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                );
              }
            : null,
        child: const SizedBox(
          width: 330.0,
          height: 50.0,
          child: Center(
            child: Text(
              'Подтвердить',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
