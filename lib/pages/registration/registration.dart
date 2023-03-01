import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/authorization/auth.dart';


import '../home/home.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  String tabelNumber = "";
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
                    padding: const EdgeInsets.only(top: 50.0, left: 20),
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
                      'Регистрация',
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
                  onPressed: () {
                    if (numberCorrect()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CodeVerificationRegistration()));
                    }
                  },
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

  numberCorrect() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
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
  String verifyField1 = "";
  String verifyField2 = "";
  String verifyField3 = "";
  String verifyField4 = "";
  String verifyField5 = "";
  int secondsRemaining = 60;
  bool enableResend = false;
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
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, right: 60),
                    child: Text(
                      'Верификация',
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
                          onChanged: (val) {
                            setState(() {
                              verifyField1 = val;
                            });
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          // validator: (val) {
                          //   if (val!.length < 1) {
                          //     return ;
                          //   }
                            
                          // },
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
                        child: TextField(
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
                        child: TextField(
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
                        child: TextField(
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
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(authButtonColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (verifyNumberCorrect()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NewPassRegistrationPage()));
                          }
                        },
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

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  verifyNumberCorrect() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
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
  String rePassword = "";
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
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, right: 70),
                    child: Text(
                      'Регистрация',
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
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: enabledBorderLoginColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: errorBorderPasswordPage)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      labelStyle: TextStyle(color: labelTextLoginColor),
                      floatingLabelStyle:
                          TextStyle(color: floatingLoginLabelColor),
                      labelText: 'Пароль',
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Пароль должен состоять минимум из 6 символов";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _confirmPass,
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
                          borderSide:
                              BorderSide(color: errorBorderPasswordPage)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: focusedBorderLoginColor)),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: passwordHideColor,
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                              passwordHideColor =
                                  passwordHideColor == Colors.grey
                                      ? passwordUnHideColor
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
                    onChanged: (val) {
                      setState(() {
                        rePassword = val;
                      });
                    },
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Пароль должен состоять минимум из 6 символов";
                      }
                      if (val != _pass.text) {
                        return "Пароль не совпадает";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
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
                        'Подтвердить',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (passwordCorrect()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  passwordCorrect() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
