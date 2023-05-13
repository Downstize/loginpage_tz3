import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../main.dart';

final List<String> items1 = [
  'УВП-111',
  'УВП-112',
  'УВП-113',
  'УВВ-114',
];

final List<String> items2 = [
  'УВП-211',
  'УВП-212',
  'УВП-213',
  'УВВ-214',
];

final List<String> items3 = [
  'УВП-311',
  'УВП-312',
  'УВП-313',
  'УВВ-314',
];

final List<String> items4 = [
  'УВП-411',
  'УВП-412',
  'УВП-413',
  'УВВ-414',
];

final List<String> courses = ["1", "2", "3", "4"];

class Student {
  String name;
  int? note;
  String group;
  String? subject;

  Student(this.name, this.note, this.group, this.subject);
}

final List<Student> students = [
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Ковалев А.А.", 5, "Group 2", "Subject X"),
  Student("Иванов А.А.", null , "Group 2", "Subject Y"),
  Student("Ковалев А.А.", 5, "Group A", "Subject Alpha"),
  Student("Иванов А.А.", null, "Group B", "Subject Delta"),
];

List<Student> loaded = [];

class TeacherResultsPage extends StatefulWidget {
  const TeacherResultsPage({super.key});

  @override
  State<TeacherResultsPage> createState() => _TeacherResultsPageState();
}

class _TeacherResultsPageState extends State<TeacherResultsPage> {
  String _selectedValue = 'Select a value';

  String _selectedCourse = '1 Курс';
  String _selectedGroup = 'Group 1';
  String _selectedSubject = 'Subject A';

  List<String> _getGroupsForCourse(String course) {
    // Return the list of groups for the selected course
    // This can be replaced with your own logic for getting groups based on the selected course
    switch (course) {
      case '1 Курс':
        return ['Group 1', 'Group 2', 'Group 3'];
      case '2 Курс':
        return ['Group A', 'Group B', 'Group C'];
      case '3 Курс':
        return ['Group D', 'Group E', 'Group F'];
      case '4 Курс':
        return ['Group G', 'Group H', 'Group I'];
      default:
        return [];
    }
  }

  List<String> _getSubjectsForGroup(String group) {
    // Return the list of subjects for the selected group
    // This can be replaced with your own logic for getting subjects based on the selected group
    switch (group) {
      case 'Group 1':
        return ['Subject A', 'Subject B', 'Subject C'];
      case 'Group 2':
        return ['Subject X', 'Subject Y', 'Subject Z'];
      case 'Group 3':
        return ['Subject P', 'Subject Q', 'Subject R'];
      case 'Group A':
        return ['Subject Alpha', 'Subject Beta', 'Subject Gamma'];
      case 'Group B':
        return ['Subject Delta', 'Subject Epsilon', 'Subject Zeta'];
      case 'Group C':
        return ['Subject Kappa', 'Subject Lambda', 'Subject Mu'];
      case 'Group D':
        return ['Subject 1', 'Subject 2', 'Subject 3'];
      case 'Group E':
        return ['Subject 4', 'Subject 5', 'Subject 6'];
      case 'Group F':
        return ['Subject 7', 'Subject 8', 'Subject 9'];
      case 'Group G':
        return ['Subject 10', 'Subject 11', 'Subject 12'];
      case 'Group H':
        return ['Subject Delta', 'Subject Epsilon', 'Subject Zeta'];
      case 'Group I':
        return ['Subject Kappa', 'Subject Lambda', 'Subject Mu'];

      default:
        return [];
    }
  }

  void _getStudentsForGroupAndSubject(String group, String subject) {
// Filter the list of students based on the group and subject
    loaded = students
        .where(
            (student) => student.group == group && student.subject == subject)
        .toList();
    print(loaded);
    setState(() {});
  }

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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownWidget(
                    value: _selectedCourse,
                    items: ['1 Курс', '2 Курс', '3 Курс', '4 Курс'],
                    onChanged: (value) {
                      setState(() {
                        value!=null ?
                        _selectedCourse = value: _selectedCourse = '1 курс';
                        // Reset the selected group and subject
                        // _selectedGroup = 'Group 1';
                        // _selectedSubject = 'Subject 1';
                        _selectedGroup = _getGroupsForCourse(_selectedCourse!)[0];
                        _selectedSubject = _getSubjectsForGroup(_selectedGroup!)[0];
                      });
                    },
                    height: 50,
                  ),
                ),
                if (_selectedCourse != null)
                  Expanded(
                    child: DropdownWidget(
                      value: _selectedGroup,
                      items: _getGroupsForCourse(_selectedCourse!),
                      onChanged: (value) {
                        setState(() {
                          value!=null ?
                          _selectedGroup = value: _selectedGroup = 'Group 1';
                          _selectedSubject =
                              _getSubjectsForGroup(_selectedGroup!)[0];
                        });
                      },
                      height: 50,
                    ),
                  ),
                if (_selectedGroup != null)
                  Expanded(
                    child: DropdownWidget(
                      value: _selectedSubject,
                      items: _getSubjectsForGroup(_selectedGroup!),
                      onChanged: (value) {
                        setState(() {
                          value != null ?
                          _selectedSubject = value: _selectedSubject = 'Subject 1';
                        });
                        _getStudentsForGroupAndSubject(
                            _selectedGroup, _selectedSubject);
                        print(loaded);
                        print('Selected Course: $_selectedCourse');
                        print('Selected Group: $_selectedGroup');
                        print('Selected Subject: $_selectedSubject');
                      },
                      height: 50,
                    ),
                  ),
                SizedBox(height: 16),
              ],
            ),
            SessionTeacherWidget(subjectName: _selectedSubject, groupName: _selectedGroup, students: students,)
          ],
        ),
      ),
    );
  }
}

class DropdownWidget extends StatefulWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  final double? height;
  final String value;

  DropdownWidget(
      {required this.items,
      required this.onChanged,
      required this.height,
      required this.value});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  //String? selectedItem1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: widget.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              value: widget.value,
              onChanged: widget.onChanged,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}


class SessionTeacherWidget extends StatefulWidget {
  final String subjectName;
  final String groupName;
  final List<Student> students;

  SessionTeacherWidget({
    super.key,
    required this.subjectName,
    required this.groupName,
    required this.students,
  });

  @override
  State<SessionTeacherWidget> createState() => _SessionTeacherWidgetState();
}


class _SessionTeacherWidgetState extends State<SessionTeacherWidget> {

  @override
  void initState() {
    super.initState();
    print(loaded);
    print("gg");
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Имя')),
        DataColumn(label: Text('Оценка')),
      ],
      rows: loaded.map((student) {

        return DataRow(
          cells: [
            DataCell(Text(student.name)),
            DataCell(student.note != null
                ? Text(student.note.toString())
                : TextFormField(
                    decoration: InputDecoration(hintText: 'Enter note'),
                    onSaved: (value) {
                      setState(() {
                        student.note = int.parse(value!);
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a note.';
                      }
                      final n = int.tryParse(value);
                      if (n == null || n < 0 || n > 100) {
                        return 'Please enter a valid note between 0 and 100.';
                      }
                      return null;
                    },
                  )),
          ],
        );
      }).toList(),
    );

  }
}

// class DropdownWidget extends StatefulWidget {
//   final List<String> items;
//   final Function (String) onChanged;
//   final double? height;

//   DropdownWidget(
//       {required this.items, required this.onChanged, required this.height});

//   @override
//   _DropdownWidgetState createState() => _DropdownWidgetState();
// }

// class _DropdownWidgetState extends State<DropdownWidget> {
//   String?
//       selectedItem; // Define selectedItem as nullable to avoid null value error.

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.all(20),
//       child: DropdownButtonHideUnderline(
//         child: GFDropdown(
//           padding: const EdgeInsets.all(15),
//           borderRadius: BorderRadius.circular(20),
//           border: const BorderSide(color: profileBackground, width: 1),
//           dropdownButtonColor: Colors.white,
//           items: widget.items
//               .map((value) => DropdownMenuItem(
//                     value: value,
//                     child: Text(value),
//                   ))
//               .toList(),
//           value: selectedItem,
//           onChanged: (newValue) {
//             setState(() {
//               selectedItem = newValue as String?;
//             }); // Call the onChanged callback with the new selected value.
//           },
//           isExpanded: false,
//           isDense: true,
//         ),
//       ),
//     );
//   }
// }

// class _DropdownWidgetState extends State<DropdownWidget> {

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   selectedItem = widget.items.first;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     var selectedItem;
//     return Container(
//         height: widget.height,
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.all(20),
//         child: DropdownButtonHideUnderline(
//           child: GFDropdown(
//             padding: const EdgeInsets.all(15),
//             borderRadius: BorderRadius.circular(20),
//             border: const BorderSide(color: profileBackground , width: 1),
//             dropdownButtonColor: Colors.white,
//             items: widget.items
//                 .map((value) => DropdownMenuItem(
//                       value: value,
//                       child: Text(value),
//                     ))
//                 .toList(),
//             value: selectedItem,
//             onChanged: (newValue) {
//               setState(() {
//                 selectedItem = newValue;
//               });
//             },
//           ),
//         )
//         // child: DropdownButtonFormField<String>(
//         //   value: selectedItem,
//         //   decoration: InputDecoration(
//         //     labelText: 'Select an item',
//         //     border: OutlineInputBorder(),
//         //   ),
//         //   items: widget.items
//         //       .map((item) => DropdownMenuItem(
//         //             value: item,
//         //             child: Text(item),
//         //           ))
//         //       .toList()
//         //       .toSet()
//         //       .toList(),
//         //   onChanged: (value) {
//         //     setState(() {
//         //       selectedItem = value!;
//         //       widget.onChanged(selectedItem);
//         //     });
//         //   },
//         // ),
//         );
//   }
// }
