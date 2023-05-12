import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Виджет AudiencesPage сверху CupertinoSlidingSegmentedControl переключающий достпуные аудитори и забронированные вами использует ListView.builder, который создает виджеты по мере их прокрутки в него загружается текст из массива с номерами аудиторий он отопражает container с номером аудитории и при нажатии открываетс новая страница с свободноми интервалами для бронирования.

class AudiencesPage extends StatefulWidget {
  const AudiencesPage({super.key});

  @override
  State<AudiencesPage> createState() => _AudiencesPageState();
}

class _AudiencesPageState extends State<AudiencesPage> {
  int test = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 54, 93, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        flexibleSpace: SafeArea(
          child: Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
            child: CupertinoSlidingSegmentedControl(
              thumbColor: Colors.white,
              children: const <int, Widget>{
                1: Icon(Icons.search, color: Color.fromRGBO(27, 54, 93, 1)),
                2: Icon(Icons.school, color: Color.fromRGBO(27, 54, 93, 1)),
                3: Icon(Icons.history, color: Color.fromRGBO(27, 54, 93, 1)),
              },
              onValueChanged: (value) {
                test = value!;
                setState(() {});
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ListView.builder(
                itemCount: test,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (test == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                IntervalAudiencesPage(number: index),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: CupertinoColors.tertiarySystemFill,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Center(
                          child: Text(
                            'Аудитория №${index + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromRGBO(27, 54, 93, 1)),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Пустой виджет с возвращающий placeholder с текстом "Здесь будеут доступные временные интервалы для бронирования"

class IntervalAudiencesPage extends StatefulWidget {
  int number;
  IntervalAudiencesPage({Key? key, required this.number}) : super(key: key);

  @override
  State<IntervalAudiencesPage> createState() => _IntervalAudiencesPageState();
}

class _IntervalAudiencesPageState extends State<IntervalAudiencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(27, 54, 93, 1),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromRGBO(27, 54, 93, 1), //change your color here
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          flexibleSpace: SafeArea(
            child: Center(
              child: Text(
                'Аудитория №${widget.number + 1}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(27, 54, 93, 1)),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text(
                                    'Забронировать аудиторию на ${index + 1}:00 - ${index + 2}:00?',
                                    textAlign: TextAlign.center),
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(27, 54, 93, 1),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Да',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(124, 19, 19, 1),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Нет',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.tertiarySystemFill,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}:00 - ${index + 2}:00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(27, 54, 93, 1)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ))
          ],
        ));
  }
}



// GridView.builder( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 1.5),
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: CupertinoColors.tertiarySystemFill,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       margin: const EdgeInsets.only(top: 20, left: 20),
//                       child: Container(
//                         margin: EdgeInsets.only(top: 10, bottom: 10),
//                         child: Center(
//                           child: Text(
//                             '${index + 1}:00 - ${index + 2}:00',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),