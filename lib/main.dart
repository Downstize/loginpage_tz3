import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loginpage_tz3/pages/home/home.dart';
import 'pages/authorization/auth.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:loginpage_tz3/bd/isar_service.dart';

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
const Color colorHome = Colors.white;
const Color colorSchedule = Colors.white;
const Color colorTasks = Colors.white;
const Color colorAudiences = Colors.white;
const Color colorProfile = Colors.white;
const Color colorSelected = Color.fromRGBO(27, 54, 93, 1);
const Color colorUnSelected = Colors.grey;
const Color borderSide = Colors.grey;
const Color registrationTextColor = Colors.black;
const Color errorBorderPasswordPage = Colors.grey;
Color passwordTopHideColor = Colors.grey;
Color passwordBottomHideColor = Colors.grey;
const Color passwordTopUnHideColor = Color.fromRGBO(27, 54, 93, 1);
const Color passwordBottomUnHideColor = Color.fromRGBO(27, 54, 93, 1);
const Color floatButtonColorTaskPage = Color.fromRGBO(27, 54, 93, 1);
const Color iconsBackgroundColorOnTaskPage = Color.fromRGBO(27, 54, 93, 1);
const Color containersColorOnTaskPage = Color.fromRGBO(162, 172, 171, 1);

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  final i = IsarService();
  i.isarConfig;
  runApp(const Auth());
}

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Navigo'),
        debugShowCheckedModeBanner: false,
        home: const HomePage()//AuthPage()
      ),
    );
  }
}
