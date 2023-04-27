import 'package:flutter/material.dart';
import '../../../../main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> news = [
    {
      "postTime": "6 апр в 11:00",
      "postText":
          "Команда Российского университета транспорта стала бронзовым призёром логистического турнира.",
      "postImage": "assets/image/logistic_news.jpeg"
    },
    {
      "postTime": '7 апр в 14:30',
      "postText": "Продолжается регистрация на кейс-чемпионат «PRO СТРОЙ»",
      "postImage": "assets/image/case_news.jpeg"
    },
    {
      "postTime": '12 апр в 10:00',
      "postText":
          "Финал Высшей студенческой квиз-лиги «Учись, студент!» прошёл 14 апреля в Новой Государственной Третьяковской галерее.",
      "postImage": "assets/image/learn_student_news.jpeg"
    },
    {
      "postTime": '15 апр в 19:00',
      "postText":
          "Благотворительный фонд «Система» при поддержке Минобрнауки России проводит стипендиальную программу «Система».",
      "postImage": "assets/image/system_news.jpeg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containersColorOnTaskPage,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        flexibleSpace: SafeArea(
          child: Center(
            child: const Text(
              "Главная",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color:  Color.fromRGBO(27, 54, 93, 1)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                  maxHeight: double.infinity),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 30,
                                          child: ClipOval(
                                            child: Image.asset(
                                                "assets/image/logo_imdt.jpeg"),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 10),
                                              child: Text(
                                                "ИУЦТ РУТ (МИИТ)",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,
                                                    color: colorSelected),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding:
                                                 const EdgeInsets.only(right: 43),
                                              child: Text(
                                                news[index]['postTime'],
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: colorSelected),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              news[index]['postText'],
                                              style: const TextStyle(
                                                  color:
                                                      containersColorOnTaskPage,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      constraints: const BoxConstraints(
                                          maxHeight: double.infinity),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.1,
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  news[index]['postImage']),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 25)
                  ],
                );
              }),
        ]),
      ),
    );
  }
}
