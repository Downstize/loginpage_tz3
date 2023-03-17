import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';

bool passwordVisibleForTask = false;

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

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
        backgroundColor: floatButtonColorTaskPage,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 380,
              height: 40,
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
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350],
                    ),
                    margin: const EdgeInsets.only(right: 15),
                    width: 180,
                    height: 85,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 33,
                                height: 33,
                                decoration: const BoxDecoration(
                                  color: iconsBackgroundColorOnTaskPage,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: const Icon(Icons.event_note,
                                    color: Colors.white, size: 25),
                              ),
                              const Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Запланировано',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                  margin: const EdgeInsets.only(left: 15),
                  width: 180,
                  height: 85,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 33,
                                height: 33,
                                decoration: const BoxDecoration(
                                  color: iconsBackgroundColorOnTaskPage,
                                  borderRadius:  BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: const Icon(Icons.today,
                                    color: Colors.white, size: 25),
                              ),
                              const Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Сегодня',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350],
                    ),
                    margin: const EdgeInsets.only(right: 15),
                    width: 180,
                    height: 85,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 33,
                                height: 33,
                                decoration: const BoxDecoration(
                                  color: iconsBackgroundColorOnTaskPage,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: const Icon(Icons.flag,
                                    color: Colors.white, size: 25),
                              ),
                              const Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'С флажком',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                  margin: const EdgeInsets.only(left: 15),
                  width: 180,
                  height: 85,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 33,
                                height: 33,
                                decoration: const BoxDecoration(
                                  color: iconsBackgroundColorOnTaskPage,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: const Icon(Icons.all_inbox,
                                    color: Colors.white, size: 25),
                              ),
                              const Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Все',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350],
                    ),
                    margin: const EdgeInsets.only(left: 15),
                    width: 180,
                    height: 85,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 33,
                                height: 33,
                                decoration: const BoxDecoration(
                                  color: iconsBackgroundColorOnTaskPage,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: const Icon(Icons.done,
                                    color: Colors.white, size: 25),
                              ),
                              const Expanded(child: Text('')),
                              Text(
                                countLocalTask,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Завершено',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                Text('Мои списки',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ]),
            ),
            const SizedBox(height: 5),
            Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                  
                  width: 380,
                  height: 50,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 9, left: 10, right: 7),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 33,
                                height: 33,
                                decoration: const BoxDecoration(
                                  color: iconsBackgroundColorOnTaskPage,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)),
                                ),
                                child: const Icon(Icons.list,
                                    color: Colors.white, size: 25),
                              ),
                              Padding(
                            padding: const EdgeInsets.only(left: 15, top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Напоминания',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                              const Expanded(child: Text('')),
                              Padding(
                                padding: const EdgeInsets.only(top:9),
                                child: Text(
                                  countLocalTask,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                             const Padding(
                               padding:  EdgeInsets.only( top: 5),
                                child: Icon(Icons.keyboard_arrow_right, size: 25,),
                              )
                            ],
                          ),
                         
                         
                        ],
                      ),
                      
                    ),
                ),
          ]),
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Добавление задания'),
              content: TextField(
                autofocus: true,
                decoration:
                    const InputDecoration(hintText: '[Предмет]: [Задание]'),
                controller: controller,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              actions: [
                Card(
                  color: const Color.fromRGBO(27, 54, 93, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    onPressed: submit,
                    child: const Text(
                      'Добавить',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )),
      );
  void submit() {
    Navigator.of(context).pop(controller.text);
  }
}
