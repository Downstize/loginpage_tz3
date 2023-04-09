import 'package:flutter/material.dart';

class MediaWidthHeight extends StatelessWidget {
  const MediaWidthHeight({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeArea = MediaQuery.of(context).padding;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double leftPadding = safeArea.left;
    double topPadding = safeArea.top;
    double rightPadding = safeArea.right;
    double bottomPadding = safeArea.bottom;
    return Container(
      height: 150,
      width: screenWidth,
      color: Colors.white,
      child: Column(
        children: [
          Text('Width of the screen: $screenWidth'),
          Text('Height of the screen: $screenHeight'),
          Text('left padding of the screen: $leftPadding'),
          Text('top padding of the screen: $topPadding'),
          Text('right padding of the screen: $rightPadding'),
          Text('bottom padding of the screen: $bottomPadding'),
        ],
      ),
    );
  }
}

//For Device settings 

//Responsive / Adaptive