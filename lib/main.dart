import 'package:flutter/material.dart';
import 'pages/authorization/auth.dart';

const Color arrowBackColorForgetPasswordPage = Color.fromRGBO(27, 54, 93, 1);
const Color labelTextColorForgetPasswordPage = Color.fromRGBO(27, 54, 93, 1);
const Color backgroundColor = Colors.white;
const Color authColor = Color.fromRGBO(27, 54, 93, 1);
const Color enabledBorderLoginColor = Colors.grey;
const Color focusedBorderLoginColor = Color.fromRGBO(27, 54, 93, 1);
const Color enabledBorderPasswordColor = Colors.grey;
const Color focusedBorderPasswordColor = Color.fromRGBO(27, 54, 93, 1);
const Color labelTextLoginColor = Colors.grey;
const Color labelTextPasswordColor = Colors.grey;
const Color authButtonColor = Color.fromRGBO(27, 54, 93, 1);
const Color forgotPasswordTextColor = Colors.grey;
Color passwordHideColor = Colors.grey;
const Color passwordUnHideColor = Color.fromRGBO(27, 54, 93, 1);
const Color floatingLoginLabelColor = Color.fromRGBO(27, 54, 93, 1);
const Color floatingPasswordLabelColor = Color.fromRGBO(27, 54, 93, 1);
const Color colorHome = Color.fromRGBO(27, 54, 93, 1);
const Color colorSchedule = Color.fromRGBO(27, 54, 93, 1);
const Color colorTasks = Color.fromRGBO(27, 54, 93, 1);
const Color colorMessenger = Color.fromRGBO(27, 54, 93, 1);
const Color colorProfile = Color.fromRGBO(27, 54, 93, 1);
const Color colorSelected = Color.fromRGBO(27, 54, 93, 1);
const Color colorUnSelected = Colors.grey;
const Color borderSide = Colors.grey;
const Color registrationTextColor = Colors.black;
const Color errorBorderPasswordPage = Colors.grey;
Color passwordTopHideColor = Colors.grey;
Color passwordBottomHideColor = Colors.grey;
const Color passwordTopUnHideColor = Color.fromRGBO(27, 54, 93, 1);
const Color passwordBottomUnHideColor = Color.fromRGBO(27, 54, 93, 1);

void main(List<String> args) {
  runApp(const Auth());
}

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Navigo'),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
