import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage_tz3/bd/isar_service.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/registration/registration.dart';
import '../forgotPassword/forgotpassword.dart';
import 'password.dart';
import 'package:loginpage_tz3/Services/internet_checker.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

bool passwordVisible = false;
String value_tab2 = "";

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String tabelNumber = "";
  bool buttonAuth = false;
  @override
  void initState() {
    super.initState();
    _inputController.addListener(() {
      setState(() {
        buttonAuth = _inputController.text.length == 7;
      });
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i = IsarService();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
            Visibility(
              visible: Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected,
              child: const InternetNotAvailable(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: SizedBox(
                  width: 300.0,
                  height: 175.0,
                  child: Image.asset('assets/image/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 85.0, right: 111),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Добро пожаловать!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: authColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 180),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Войдите в свой аккаунт',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: authColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _inputController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle:
                        TextStyle(color: floatingLoginLabelColor),
                    labelText: 'Табельный номер',
                  ),
                  onChanged: (val) {
                    setState(() {
                      value_tab2 = val;
                      val = "";
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: authButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  disabledForegroundColor: Colors.grey,
                ),
                onPressed: buttonAuth
                    ? () async {
                        int checker2 = await i.findUsers(value_tab2);
                        log(checker2.toString());
                        if (checker2 == 0) {
                          if (numberCorrect()) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordAuthPage()));
                          }
                        } else if (checker2 == 1) {
                          // ignore: use_build_context_synchronously
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Ошибка'),
                                      content: const Text(
                                          'Табельный номер не зарегистрирован'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      actions: [
                                        Card(
                                          color: const Color.fromRGBO(
                                              27, 54, 93, 1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Ок',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ]));
                        }
                      }
                    : null,
                child: const SizedBox(
                  width: 330.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Войти',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: const BorderSide(width: 1, color: borderSide),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const SizedBox(
                  width: 330.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                          fontSize: 20,
                          color: registrationTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()),
                  );
                },
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: forgotPasswordTextColor),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  numberCorrect() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
