import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TimetableTile extends StatefulWidget {
  final String type;
  final String lesson;
  final String theacher;
  final String cabinet;
  final String lesson_number;

  const TimetableTile(
      {Key? key,
      required this.lesson,
      required this.theacher,
      required this.cabinet,
      required this.lesson_number,
      required this.type})
      : super(key: key);

  @override
  _TimetableTileState createState() => _TimetableTileState();
}

class _TimetableTileState extends State<TimetableTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      duration: const Duration(seconds: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 4,
                      left: 8,
                      right: 8,
                      bottom: 4,
                    ),
                    child: Text(
                      widget.type,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(child: Text('')),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  widget.lesson_number,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Text(
              widget.lesson,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Text(
              widget.theacher,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
            child: Text(
              widget.cabinet,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
