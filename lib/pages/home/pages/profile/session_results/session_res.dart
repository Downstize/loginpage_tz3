import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/bd/hive_service.dart';
import 'package:loginpage_tz3/main.dart';
import 'package:expandable/expandable.dart';
import 'package:loginpage_tz3/pages/registration/registration.dart';

String group = "УВП-211";

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () async {
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => const ProfilePage2(), ));
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => const HomePage()));
              Navigator.pop(context);
            },
            color: profileBackground,
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        flexibleSpace: const SafeArea(
          child: Center(
            child: Text(
              "Результаты Сессий",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(27, 54, 93, 1)),
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   bottomOpacity: 0.0,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   leading: BackButton(
      //     onPressed: () async {
      //       // Navigator.push(context,
      //       //   MaterialPageRoute(builder: (context) => const ProfilePage2(), ));
      //       // Navigator.push(context,
      //       //   MaterialPageRoute(builder: (context) => const HomePage()));
      //       Navigator.pop(context);
      //     },
      //     color: profileBackground,
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     "Результаты Сессий",
      //     style: TextStyle(fontSize: 28, color: profileBackground),
      //   ),
      // ),
      backgroundColor: profileBackground,
      body: Container(
        margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          //height: double.infinity,
          child: ListView(
            children: [
                  //color: Colors.white,
                Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    MenuResultWidget(
                      sessionName: "1-й семестр",
                    ),
                    SizedBox(height: 10),
                    MenuResultWidget(
                      sessionName: "2-й семестр",
                    ),
                    SizedBox(height: 10),
                    MenuResultWidget(
                      sessionName: "3-й семестр",
                    ),
                    SizedBox(height: 10),
                    MenuResultWidget(
                      sessionName: "4-й семестр",
                    ),
                    SizedBox(height: 10),
                    MenuResultWidget(
                      sessionName: "5-й семестр",
                    ),
                    SizedBox(height: 10),
                    MenuResultWidget(
                      sessionName: "6-й семестр",
                    ),
                    SizedBox(height: 20),
                  ]),
            ],
          ),
        ),
    );
  }
}

class MenuResultWidget extends StatefulWidget {
  final String sessionName;

  MenuResultWidget({
    super.key,
    required this.sessionName,
  });

  @override
  State<MenuResultWidget> createState() => _MenuResultWidgetState();
}

class _MenuResultWidgetState extends State<MenuResultWidget> {
  //final List<List<String>> info = [["Математика","Экзамен", "Васильчук А.В.", "5", "5"],["Русский Язык", "Экзамен", "Васильчук А.В.", "5", "5"],["Асинхронное программирование", "Экзамен", "Васильчук А.В.", "5", "5"]];
  List<List<String>> sessionList = [];

  @override
  void initState() {
    super.initState();
    _getSessionList();
  }

  Future<void> _getSessionList() async {
    final h = HiveService();
    sessionList = await h.loadSession(widget.sessionName, "4567012");
    //print(sessionList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> subject = [];
    List<String> type = [];
    List<String> teachR = [];
    List<String> note1 = [];
    List<String> note2 = [];

    //_getSessionList();
    for (int i = 0; i < sessionList.length; i++) {
      for (int j = 0; j < sessionList[i].length; j = j + 6) {
        subject.add(sessionList[i][j]);
        type.add(sessionList[i][j + 1]);
        teachR.add(sessionList[i][j + 2]);
        note1.add(sessionList[i][j + 3]);
        note2.add(sessionList[i][j + 4]);
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CupertinoColors.tertiarySystemFill,
      ),
      //padding: EdgeInsets.all(0),
      child: ExpandablePanel(
        header: Padding(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.sessionName,
              style: TextStyle(fontSize: 18, color: Colors.black,),
            ),
          ),
        ),
        collapsed: Container(),
        expanded: Container(
          //color: CupertinoColors.tertiarySystemFill,
          child: Column(
            children: [
              SizedBox(height: 10),
              RefreshIndicator(
                onRefresh: _getSessionList,
                child: Column(
                  children: List.generate(sessionList.length, (index) {
                    return Column(
                      children: [
                        rowNote(
                            sessionList[index][0],
                            sessionList[index][1],
                            sessionList[index][2],
                            sessionList[index][3],
                            sessionList[index][4]),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }),
                ),
              )

                  // child: Column(
                  //   children: [
                  //     for (int i = 0; i < sessionList.length; i++)
                  //       rowNote(
                  //           sessionList[i][0],
                  //           sessionList[i][1],
                  //           sessionList[i][2],
                  //           sessionList[i][3],
                  //           sessionList[i][4]),
                  //     SizedBox(
                  //       height: 20,
                  //     )
                  //   ],
                  // ),

            ],
          ),
        ),
      ),
    );
  }

  Widget rowNote(
      String subject, String type, String teach, String note1, String note2) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/14,
            color: Colors.grey.withOpacity(0.4),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: profileBackground,
                  ),
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
                  child: subject.split(" ").length == 1  ? 
                  Center(
                    child: Text(
                      "${subject}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        //fontSize: 15,
                      ),
                    ),
                  ) : 
                   Center(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                      Text(
                            "${subject.split(" ")[0]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                      Text(
                              "${subject.split(" ")[1]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),    
                                 ]),
                   ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: profileBackground,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "${type}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        //fontSize: 15
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          DataTable(columns: [
            DataColumn(label: Text("Преподаватель")),
            DataColumn(label: Text("Оценка"))
          ], rows: [
            DataRow(cells: [
              DataCell(Text("${teach}")),
              DataCell(Center(child: Text("${note1}")))
            ]),
            DataRow(cells: [
              DataCell(Text("Текущий контроль(${type})")),
              DataCell(Center(child: Text("${note2}")))
            ]),
          ]),
        ],
      ),
    );
  }
}
