import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../main.dart';

class TeacherResultsPage extends StatefulWidget {
  const TeacherResultsPage({super.key});

  @override
  State<TeacherResultsPage> createState() => _TeacherResultsPageState();
}

class _TeacherResultsPageState extends State<TeacherResultsPage> {
  String _selectedValue = 'Select a value';

  final List<String> items = [
    '0',
    '1',
    '2',
    '3',
  ];

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
            Row(children: [
              Expanded(
                child: Container(
                  //width: double.maxFinite,
                  //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: DropdownWidget(
                      items: items, onChanged: (selectedItem) {}, height: 50),
                ),
              ),
              Expanded(
                child: Container(
                  //width: double.maxFinite,
                  //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: DropdownWidget(
                    items: items,
                    onChanged: (selectedItem) {},
                    height: 50,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class DropdownWidget extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final double? height;

  DropdownWidget(
      {required this.items, required this.onChanged, required this.height});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

  // @override
  // void initState() {
  //   super.initState();
  //   selectedItem = widget.items.first;
  // }

  @override
  Widget build(BuildContext context) {
    var selectedItem;
    return Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: DropdownButtonHideUnderline(
          child: GFDropdown(
            padding: const EdgeInsets.all(15),
            borderRadius: BorderRadius.circular(20),
            border: const BorderSide(color: profileBackground , width: 1),
            dropdownButtonColor: Colors.white,
            items: widget.items
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            value: selectedItem,
            onChanged: (newValue) {
              setState(() {
                selectedItem = newValue;
              });
            },
          ),
        )
        // child: DropdownButtonFormField<String>(
        //   value: selectedItem,
        //   decoration: InputDecoration(
        //     labelText: 'Select an item',
        //     border: OutlineInputBorder(),
        //   ),
        //   items: widget.items
        //       .map((item) => DropdownMenuItem(
        //             value: item,
        //             child: Text(item),
        //           ))
        //       .toList()
        //       .toSet()
        //       .toList(),
        //   onChanged: (value) {
        //     setState(() {
        //       selectedItem = value!;
        //       widget.onChanged(selectedItem);
        //     });
        //   },
        // ),
        );
  }
}
