import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:loginpage_tz3/main.dart';
import '../home/home.dart';

class PasswordAuthPage extends StatefulWidget {
  const PasswordAuthPage({super.key});

  @override
  State<PasswordAuthPage> createState() => _PasswordAuthPageState();
}

class _PasswordAuthPageState extends State<PasswordAuthPage> {
  final _inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String password = "";
  bool buttonAuth = false;
  @override
  void initState() {
    super.initState();
    _inputController.addListener(() {
      setState(() {
        buttonAuth = _inputController.text.length>=6;
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: arrowBackColorForgetPasswordPage,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, right: 50),
                  child: Text(
                    'Авторизация',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: labelTextColorForgetPasswordPage,
                    ),
                  ),
                ),
                const Text(""),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 180.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 160),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Введите пароль',
                    style: TextStyle(
                      fontSize: 25,
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
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide:
                            BorderSide(color: enabledBorderPasswordColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide:
                            BorderSide(color: focusedBorderPasswordColor)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: errorBorderPasswordPage)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: passwordHideColor,
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                            passwordHideColor = passwordHideColor == Colors.grey
                                ? passwordUnHideColor
                                : Colors.grey;
                          },
                        );
                      },
                    ),
                    labelStyle: const TextStyle(color: labelTextPasswordColor),
                    floatingLabelStyle: const TextStyle(
                      color: floatingPasswordLabelColor,
                    ),
                    labelText: 'Пароль',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  // validator: (val) {
                  //   if (val!.length < 6) {
                  //     return "Введите корректные данные";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  onChanged: (val) {
                    setState(() {
                      password = val;
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
                onPressed: buttonAuth ? () {
                  if (passwordCorrect()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                } : null,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  passwordCorrect() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
