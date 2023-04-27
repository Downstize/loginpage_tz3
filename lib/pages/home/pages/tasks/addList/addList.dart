import 'package:flutter/material.dart';
import '../../../../../main.dart';

class AddList extends StatelessWidget {
  final String nameOfList;
  const AddList({super.key, required this.nameOfList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width / 1.159,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: containersColorOnTaskPage),
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
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.list,
                              color: iconsBackgroundColorOnTaskPage),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            nameOfList,
                            style: TextStyle(
                                color: Colors.white,
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
                          "0",
                          style: const TextStyle(
                              color: Colors.white,
                              //fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}