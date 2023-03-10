import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/widgetVerify/buttonWidget.dart';
import '../authorization/auth.dart';
import 'dart:async';

bool passwordVisibleTop = false;
bool passwordVisibleBottom = false;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _inputController = TextEditingController();
  bool buttonSend = false;
  final formKey = GlobalKey<FormState>();
  String tabelNumber = "";
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
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
                    'Забыли пароль?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: labelTextColorForgetPasswordPage,
                    ),
                  ),
                ),
                Text(""),
              ],
            ),
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
                        borderSide: BorderSide(color: enabledBorderLoginColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    labelStyle: TextStyle(color: labelTextLoginColor),
                    floatingLabelStyle:
                        TextStyle(color: floatingLoginLabelColor),
                    labelText: 'Табельный номер',
                  ),
                  onChanged: (val) {
                    setState(() {
                      tabelNumber = val;
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
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CodeVerificationForgotPass()));

                        tabelNumber = tabelNumber + emailAdd;
                      }
                    : null,
                child: const SizedBox(
                  width: 330.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Отправить',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CodeVerificationForgotPass extends StatefulWidget {
  const CodeVerificationForgotPass({super.key});

  @override
  State<CodeVerificationForgotPass> createState() =>
      _CodeVerificationForgotPassState();
}

class _CodeVerificationForgotPassState
    extends State<CodeVerificationForgotPass> {
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

  bool checkVerifyCodeForgotPage() {
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: arrowBackColorForgetPasswordPage,
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, right: 60.0),
                  child: Text(
                    'Верификация',
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
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
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                      width: 330,
                      height: 50,
                      child: ButtonVerificationForgotPass(
                          active: checkVerifyCodeForgotPage())),
                ],
              ),
            ),
          ]),
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

class NewPassForgotPasswordPage extends StatefulWidget {
  const NewPassForgotPasswordPage({super.key});

  @override
  State<NewPassForgotPasswordPage> createState() =>
      _NewPassForgotPasswordPageState();
}

class _NewPassForgotPasswordPageState extends State<NewPassForgotPasswordPage> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String password = "";
  String rePassword = "";
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

  bool checkNewPassForgotPageFields() {
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
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, right: 60.0),
                    child: Text(
                      'Новый пароль',
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
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Введите новый пароль',
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
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ButtonForgotConfirm(
                      active: checkNewPassForgotPageFields())),
            ],
          ),
        ),
      ),
    );
  }
}
