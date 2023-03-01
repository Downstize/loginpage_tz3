import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/registration/registration.dart';
import '../forgotPassword/forgotpassword.dart';
import 'password.dart';

bool passwordVisible = false;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  String tabelNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
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
              padding: const EdgeInsets.only( top: 10.0, right: 180),
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
                        tabelNumber = val;
                      });
                    },
                    validator: (val) {
                      if (val!.length < 7) {
                        return "Табельный номер должен состоять из 7 символов";
                      } else {
                        return null;
                      }
                    },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(authButtonColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
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
                onPressed: () {
                  if (numberCorrect()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordAuthPage()));
                  }
                },
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
