import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_tz3/pages/week_page/search_tile.dart';
import 'api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Teachers {
  List<Teacher> teachers;

  Teachers({required this.teachers});
  factory Teachers.fromJson(Map<String, dynamic> json) => _itemFromJson(json);
}

Teachers _itemFromJson(Map<String, dynamic> json) {
  var timetableJson = json['hydra:member'] as List;
  List<Teacher> teachers =
      timetableJson.map((i) => Teacher.fromJson(i)).toList();
  return Teachers(teachers: teachers);
}

class Teacher {
  String firstName;
  String lastName;
  String middleName;
  String email;
  String description;
  String department;
  int id;

  Teacher(
      {required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.email,
      required this.description,
      required this.department,
      required this.id});

  factory Teacher.fromJson(Map<String, dynamic> json) => _teacherFromJson(json);
}

Teacher _teacherFromJson(Map<String, dynamic> json) {
  return Teacher(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      email: json['mail'] as String,
      description: json['description'] as String,
      id: json['id'] as int,
      department: json['department'] as String);
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> searchList = [];
  final myController = TextEditingController();
  String s = '';
  String dayName = '';
  String lessonTime = '';
  Future<void> _search(String text) async {
    List<String> textList = text.split(" ");
    searchList.clear();
    if (textList.length == 3) {
      var data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?firstName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?firstName=${textList[1]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?firstName=${textList[2]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?lastName=${textList[1]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?lastName=${textList[2]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?lastName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${textList[2]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${textList[1]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
    }
    if (textList.length == 2) {
      var data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?firstName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?firstName=${textList[1]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?lastName=${textList[1]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?lastName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${textList[1]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
    }
    if (textList.length == 1) {
      var data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?firstName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?lastName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
      data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${textList[0]}")))
          .body);
      if (data['hydra:totalItems'] != 0) {
        Teachers teachers = Teachers.fromJson(data);
        _set(teachers);
      }
    } else {
      var data = json.decode((await http.get(Uri.parse(
              "http://89.208.221.228/api/teachers?middleName=${null}")))
          .body);
      Teachers teachers = Teachers.fromJson(data);
      _set(teachers);
    }
  }

  void _set(Teachers teachers) {
    for (var i in teachers.teachers) {
      String s =
          '${i.id},${i.firstName},${i.lastName},${i.middleName},${i.email},${i.description},${i.department},';
      searchList.add(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade500,
          Colors.blue.shade400,
        ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          flexibleSpace: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 50, right: 20, top: 10, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: myController,
                onSubmitted: _search,
                decoration: const InputDecoration(
                    hintText: "Поиск",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  itemCount: searchList.length,
                  itemBuilder: (context, index) {
                    return SearchTile(
                        id: searchList[index].split(',')[0],
                        firstName: searchList[index].split(',')[1],
                        lastName: searchList[index].split(',')[2],
                        middleName: searchList[index].split(',')[3],
                        email: searchList[index].split(',')[4],
                        description: searchList[index].split(',')[0],
                        department: searchList[index].split(',')[5]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
