import 'package:flutter/material.dart';
class SkinContainer extends StatelessWidget {
  const SkinContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List skinColor=[
      Colors.orangeAccent,
      Colors.orange,
      Colors.grey,
      Colors.cyanAccent,
      Colors.orangeAccent,
    ];

    var size=MediaQuery.of(context).size;
    return Container(
      height: 70,
      width: size.width,
      color: Colors.grey.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(int i=0;i<skinColor.length;i++)
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: skinColor[i],
                  border: Border.all(color: Colors.white,width: 1)
              ),
            ),
        ],
      ),

    );
  }
}
