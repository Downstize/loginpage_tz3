import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/addList/addList.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/pages/all.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/pages/completed.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/pages/flagged.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/pages/scheduled.dart';
import 'package:loginpage_tz3/pages/home/pages/tasks/pages/today.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController controller = new TextEditingController();

  List<String> title = [];

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
  String text = '';
  String listName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 54, 93, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        flexibleSpace: const SafeArea(
          child: Center(
            child:  Text(
              "Задачи",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color:  Color.fromRGBO(27, 54, 93, 1)),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
         const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.159,
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: focusedBorderLoginColor)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: focusedBorderLoginColor)),
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle:
                              TextStyle(color: floatingLoginLabelColor),
                          label: Text(
                            "Поиск",
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.159,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TodayTasks()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.tertiarySystemFill,
                            ),
                            width: MediaQuery.of(context).size.width / 2.45,
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
                                          color: CupertinoColors.tertiarySystemFill,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: const Icon(Icons.today,
                                            color: iconsBackgroundColorOnTaskPage,
                                            size: 25),
                                      ),
                                      const Expanded(child: Text('')),
                                      Text(
                                        countLocalTask,
                                        style: const TextStyle(
                                            color: containersColorOnTaskPage,
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
                                              color: containersColorOnTaskPage,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ScheduledTasks()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.tertiarySystemFill,
                            ),
                            width: MediaQuery.of(context).size.width / 2.45,
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
                                          color: CupertinoColors.tertiarySystemFill,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: const Icon(Icons.event_note,
                                            color: iconsBackgroundColorOnTaskPage,
                                            size: 25),
                                      ),
                                      const Expanded(child: Text('')),
                                      Text(
                                        countLocalTask,
                                        style: const TextStyle(
                                            color: containersColorOnTaskPage,
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
                                              color: containersColorOnTaskPage,
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.159,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AllTasks()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.tertiarySystemFill,
                            ),
                            width: MediaQuery.of(context).size.width / 2.45,
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
                                          color: CupertinoColors.tertiarySystemFill,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: const Icon(Icons.all_inbox,
                                            color: iconsBackgroundColorOnTaskPage,
                                            size: 25),
                                      ),
                                      const Expanded(child: Text('')),
                                      Text(
                                        countLocalTask,
                                        style: const TextStyle(
                                            color: containersColorOnTaskPage,
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
                                              color: containersColorOnTaskPage,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FlaggedTasks()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.tertiarySystemFill,
                            ),
                            width: MediaQuery.of(context).size.width / 2.45,
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
                                          color: CupertinoColors.tertiarySystemFill,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: const Icon(Icons.flag,
                                            color: iconsBackgroundColorOnTaskPage,
                                            size: 25),
                                      ),
                                      const Expanded(child: Text('')),
                                      Text(
                                        countLocalTask,
                                        style: const TextStyle(
                                            color: containersColorOnTaskPage,
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
                                              color: containersColorOnTaskPage,
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.159,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CompletedTasks()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.tertiarySystemFill,
                            ),
                            width: MediaQuery.of(context).size.width / 2.45,
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
                                          color: CupertinoColors.tertiarySystemFill,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: const Icon(Icons.done,
                                            color: iconsBackgroundColorOnTaskPage,
                                            size: 25),
                                      ),
                                      const Expanded(child: Text('')),
                                      Text(
                                        countLocalTask,
                                        style: const TextStyle(
                                            color: containersColorOnTaskPage,
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
                                              color: containersColorOnTaskPage,
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.45,
                          height: 85,
                          
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.215,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Мои списки',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ]),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.159,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.tertiarySystemFill),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: CupertinoColors.tertiarySystemFill,
                                    ),
                                    child: const Icon(Icons.list,
                                        color: iconsBackgroundColorOnTaskPage),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: const Text(
                                      "Напоминания",
                                      style: TextStyle(
                                          color: containersColorOnTaskPage,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    countLocalTask,
                                    style: const TextStyle(
                                        color: containersColorOnTaskPage,
                                        //fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: containersColorOnTaskPage,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.159,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: title.length,
                        itemBuilder: (context, index) {
                          return AddList(nameOfList: title[index]);
                        }),
                  )
                ],
              ),
            ),
          ),
            ),
      )],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Добавление нового списка'),
                content: TextFormField(
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
                    labelText: 'Название',
                  ),
                  onChanged: (value) {
                    listName = value;
                  },
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                actions: [
                  Card(
                    color: const Color.fromRGBO(27, 54, 93, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          title.add(listName);
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Добавить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
        backgroundColor: floatButtonColorTaskPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
