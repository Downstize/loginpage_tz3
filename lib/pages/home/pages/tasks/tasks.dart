import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loginpage_tz3/main.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TextEditingController controller;
 

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String countLocalTask = '0';
  String countGroupTask = '0';
  String countAllDoneTask = '0';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await openDialog();
          if (name == null || name.isEmpty) return;
          setState(() => this.name = name);
        },
        backgroundColor: Colors.blue.shade700,
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 380,
              height: 35,
              child: TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: focusedBorderLoginColor)),
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle:
                        TextStyle(color: floatingLoginLabelColor),
                        hintTextDirection: TextDirection.ltr,
                    labelText: 'Поиск',
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top:30, left: 15, right: 15),
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
             
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => LocalTask()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(45, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.person,
                                    color: Colors.white, size: 37),
                              ),
                              Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Text('')),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 30, left: 10, right: 10),
                            child: Text(
                              'Сегодня',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => GroupTask()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(45, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.group,
                                    color: Colors.white, size: 37),
                              ),
                              Expanded(child: Text('')),
                              Text(
                                countGroupTask,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Text('')),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, bottom: 30, left: 10, right: 10),
                          child: const Text(
                            'Запланированные',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top:15, left: 15, right: 15),
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => LocalTask()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(45, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.person,
                                    color: Colors.white, size: 37),
                              ),
                              Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Text('')),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 30, left: 10, right: 10),
                            child: Text(
                              'Все',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => GroupTask()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(45, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.group,
                                    color: Colors.white, size: 37),
                              ),
                              Expanded(child: Text('')),
                              Text(
                                countGroupTask,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Text('')),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, bottom: 30, left: 10, right: 10),
                          child: Text(
                            'С флагом',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top:15, left: 15, right: 15),
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => LocalTask()));
                  },
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: Color.fromARGB(45, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Icon(Icons.person,
                                    color: Colors.white, size: 37),
                              ),
                              Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Text('')),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 30, left: 10, right: 10),
                            child: Text(
                              'Выполненные',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
              ]
            ),
            // GestureDetector(
            //   onTap: () {
            //     // Navigator.of(context).push(MaterialPageRoute(
            //     //     builder: (context) => DoneTask()));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 14.0),
            //     child: Row(
            //       children: <Widget>[
            //         Expanded(
            //           child: Card(
            //             color: Colors.white54,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20.0)),
            //             child: Padding(
            //               padding: const EdgeInsets.all(15.0),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: <Widget>[
            //                       Container(
            //                         width: 47,
            //                         height: 47,
            //                         decoration: BoxDecoration(
            //                           color: Colors.blue.shade700,
            //                           borderRadius:
            //                               BorderRadius.all(Radius.circular(30)),
            //                         ),
            //                         child: Icon(Icons.done,
            //                             color: Colors.white, size: 37),
            //                       ),
            //                       Text(
            //                         countAllDoneTask,
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontSize: 35,
            //                             fontWeight: FontWeight.w600),
            //                       )
            //                     ],
            //                   ),
            //                   SizedBox(height: 15),
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 12.0),
            //                     child: Text(
            //                       'Выполненные',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: const  [
                    Text('Мой список',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Expanded(child: Text('')),
                    Icon(Icons.expand_more)
                  ],
                ),
              ),
            ),
            //Expanded(child: TaskView()),
          ],
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text('Добавление задания'),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: '[Предмет]: [Задание]'),
                controller: controller,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              actions: [
                Card(
                  color: Colors.blue.shade700,
                  child: TextButton(
                    child: Text(
                      'Добавить',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: submit,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                )
              ],
            )),
      );
  void submit() {
    Navigator.of(context).pop(controller.text);
  }
}
