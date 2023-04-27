import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage_tz3/bd/hive_service.dart';
import 'package:loginpage_tz3/hive_collections/user_model.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/widgets/buttonWidget.dart';

bool passwordVisibleTop = false;
bool passwordVisibleBottom = false;
String value_tab = "";
String tabelNumber = "";
String rePassword = "";

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _inputController = TextEditingController();
  bool buttonSend = false;
  final formKey = GlobalKey<FormState>();

  String emailAdd = "@edu.rut-miit.ru";
  @override
  void initState() {
    super.initState();
    _inputController.addListener(() {
      setState(() {
        buttonSend = _inputController.text.length == 7;
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
    final h = HiveService();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Авторизация',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: labelTextColorForgetPasswordPage,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: arrowBackColorForgetPasswordPage,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Введите табельный номер',
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
                  padding: const EdgeInsets.only(top: 30.0),
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
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      labelStyle: TextStyle(color: Colors.grey),
                      floatingLabelStyle:
                          TextStyle(color: floatingLoginLabelColor),
                      labelText: 'Табельный номер',
                    ),
                    onChanged: (val) {
                      setState(() {
                        value_tab = val;
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
                  onPressed: buttonSend
                      ? () async {
                          int checker = await h.findUsers(value_tab);
                          log(checker.toString());
                          if (checker == 1) {
                            tabelNumber = value_tab + emailAdd;

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CodeVerificationRegistration()));

                            checker = 0;
                          } else if (checker == 0) {
                            // ignore: use_build_context_synchronously
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Ошибка'),
                                content: const Text(
                                    'Табельный номер уже зарегистрирован'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeVerificationRegistration extends StatefulWidget {
  const CodeVerificationRegistration({super.key});

  @override
  State<CodeVerificationRegistration> createState() =>
      _CodeVerificationRegistrationState();
}

class _CodeVerificationRegistrationState
    extends State<CodeVerificationRegistration> {
  final formKey = GlobalKey<FormState>();
  final _inputController1 = TextEditingController();
  final _inputController2 = TextEditingController();
  final _inputController3 = TextEditingController();
  final _inputController4 = TextEditingController();
  final _inputController5 = TextEditingController();
  String verifyField1 = "";
  String verifyField2 = "";
  String verifyField3 = "";
  String verifyField4 = "";
  String verifyField5 = "";
  int secondsRemaining = 60;
  bool enableResend = false;
  bool submit = false;
  late Timer timer;
  @override
  initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  bool checkVerifyCodeRegPage() {
    submit = _inputController1.text.isNotEmpty &&
            _inputController2.text.isNotEmpty &&
            _inputController3.text.isNotEmpty &&
            _inputController4.text.isNotEmpty &&
            _inputController5.text.isNotEmpty == true
        ? true
        : false;
    return submit;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Верификация',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: labelTextColorForgetPasswordPage,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: arrowBackColorForgetPasswordPage,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Введите код',
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
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: _inputController1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: enabledBorderLoginColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: focusedBorderLoginColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: focusedBorderLoginColor)),
                            labelStyle: TextStyle(color: labelTextLoginColor),
                            floatingLabelStyle:
                                TextStyle(color: floatingLoginLabelColor),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: _inputController2,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: enabledBorderLoginColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: focusedBorderLoginColor)),
                            labelStyle: TextStyle(color: labelTextLoginColor),
                            floatingLabelStyle:
                                TextStyle(color: floatingLoginLabelColor),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: _inputController3,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: enabledBorderLoginColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: focusedBorderLoginColor)),
                            labelStyle: TextStyle(color: labelTextLoginColor),
                            floatingLabelStyle:
                                TextStyle(color: floatingLoginLabelColor),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: _inputController4,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: enabledBorderLoginColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: focusedBorderLoginColor)),
                            labelStyle: TextStyle(color: labelTextLoginColor),
                            floatingLabelStyle:
                                TextStyle(color: floatingLoginLabelColor),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: _inputController5,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: enabledBorderLoginColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: focusedBorderLoginColor)),
                            labelStyle: TextStyle(color: labelTextLoginColor),
                            floatingLabelStyle:
                                TextStyle(color: floatingLoginLabelColor),
                          ),
                        ),
                      ),
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Отправить код повторно можно будет через $secondsRemaining',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: labelTextColorForgetPasswordPage,
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: authButtonColor,
                    disabledForegroundColor: Colors.grey),
                onPressed: enableResend ? _resendCode : null,
                child: const Text(
                  'Отправить повторно',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 310,
                      height: 50,
                      child: Buttonregistrate(active: checkVerifyCodeRegPage()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resendCode() {
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
  }
}

class NewPassRegistrationPage extends StatefulWidget {
  const NewPassRegistrationPage({super.key});

  @override
  State<NewPassRegistrationPage> createState() =>
      _NewPassRegistrationPageState();
}

class _NewPassRegistrationPageState extends State<NewPassRegistrationPage> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String password = "";
  bool buttonConfirm = false;
  @override
  void initState() {
    super.initState();
    _pass.addListener(() {
      setState(() {
        buttonConfirm = _pass.text.length >= 6;
      });
    });
    _confirmPass.addListener(() {
      setState(() {
        buttonConfirm = _confirmPass.text.length >= 6;
      });
    });
  }

  @override
  void dispose() {
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  bool checkPassRegPageFields() {
    buttonConfirm = _pass.text.length >= 6 &&
            _confirmPass.text.length >= 6 &&
            _pass.text.contains(_confirmPass.text) &&
            _confirmPass.text.contains(_pass.text) == true
        ? true
        : false;
    return buttonConfirm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Регистрация',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: labelTextColorForgetPasswordPage,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: arrowBackColorForgetPasswordPage,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Введите пароль',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: labelTextColorForgetPasswordPage,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    controller: _pass,
                    obscureText: !passwordVisibleTop,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: errorBorderPasswordPage)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisibleTop
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: passwordTopHideColor,
                        onPressed: () {
                          setState(
                            () {
                              passwordVisibleTop = !passwordVisibleTop;
                              passwordTopHideColor =
                                  passwordTopHideColor == Colors.grey
                                      ? passwordTopUnHideColor
                                      : Colors.grey;
                            },
                          );
                        },
                      ),
                      labelStyle: const TextStyle(color: labelTextLoginColor),
                      floatingLabelStyle:
                          const TextStyle(color: floatingLoginLabelColor),
                      labelText: 'Пароль',
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                        val = "";
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _confirmPass,
                    obscureText: !passwordVisibleBottom,
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
                          borderSide:
                              BorderSide(color: errorBorderPasswordPage)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisibleBottom
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: passwordBottomHideColor,
                        onPressed: () {
                          setState(
                            () {
                              passwordVisibleBottom = !passwordVisibleBottom;
                              passwordBottomHideColor =
                                  passwordBottomHideColor == Colors.grey
                                      ? passwordBottomUnHideColor
                                      : Colors.grey;
                            },
                          );
                        },
                      ),
                      labelStyle:
                          const TextStyle(color: labelTextPasswordColor),
                      floatingLabelStyle: const TextStyle(
                        color: floatingPasswordLabelColor,
                      ),
                      labelText: 'Повторите пароль',
                    ),
                    onChanged: (val) {
                      setState(() {
                        rePassword = val;
                        val = "";
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ButtonRegConfirm(active: checkPassRegPageFields())),
            ],
          ),
        ),
      ),
    );
  }
}
