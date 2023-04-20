import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginpage_tz3/pages/week_page/search_view/search_view_page.dart';

class SearchTile extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final String description;
  final String department;
  SearchTile(
      {super.key,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.email,
      required this.description,
      required this.department});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(45, 60, 60, 60),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>SearchViewPage(id: id, firstName: firstName, lastName: lastName, middleName: middleName, email: email, description: description, department: department)));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 6, left: 10, right: 10),
              child: Text(
                '$lastName $firstName $middleName',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
