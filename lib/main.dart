import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:loginpage_tz3/pages/home/home.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/addTasks/addTasks.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/tasks.dart';
import 'bd/api.dart';
import 'hive_collections/session_model.dart';
import 'pages/authorization/auth.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:loginpage_tz3/bd/hive_service.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:hive/hive.dart';
import 'package:loginpage_tz3/hive_collections/schedule_model.dart';
import 'package:loginpage_tz3/hive_collections/users_model.dart';
import 'package:loginpage_tz3/hive_collections/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

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
const Color profileBackground = Color.fromRGBO(27, 54, 93, 1);

const Color containersColorOnTaskPage = Color.fromRGBO(27, 54, 93, 1);

Future<void> addInfo() async {
  final uApi = UseApi();
  uApi.parseInHive(value_tab2);
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {
    print('Error occurred while initializing Flutter binding: $e');
  }

  await Hive.initFlutter();

  if (!kIsWeb) {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
        value = false;
      }
    });
  }

  //WidgetsFlutterBinding.ensureInitialized();
  // } on Exception catch (e) {
  //   print("Whats going with js");
  // }
  final h = HiveService();
  h.hiveConfig();
  await Hive.openBox<Schedule>('schedule');
  await Hive.openBox<User>('user');
  await Hive.openBox<ToDo>('todo');
  await Hive.openBox<Session>('session');
  h.clearTable();
  //addUsers();
  addInfo();
  //addSession();

  Intl.defaultLocale = 'ru_RU';
  runApp(const Auth());
}

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionCheckerPlus().onStatusChange;
      },
      child: MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ru', 'RU'),
          ],
          locale: const Locale('ru'),
          theme: ThemeData(fontFamily: 'Navigo'),
          debugShowCheckedModeBanner: false,
          home: const HomePage()),
    );
  }
}
