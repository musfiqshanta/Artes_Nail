import 'package:flutter/material.dart';
class ShapeContainer extends StatelessWidget {
  const ShapeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List shapeIcon=[
      "assets/images/ShapeImage1.png",
      "assets/images/ShapeImage2.png",
      "assets/images/ShapeImage5.png",
      "assets/images/ShapeImage3.png",
      "assets/images/ShapeImage4.png",
    ];


    var size=MediaQuery.of(context).size;
    return Container(
      height: 70,
      width: size.width,
      color: Colors.grey.withOpacity(0.3),

      child:Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for(int index=0;index<shapeIcon.length;index++)
              Image(image: AssetImage("${shapeIcon[index]}"),
                height: 60,width: 45,
              ),
          ],
        ),
      ),



    );
  }
}
