import 'package:flutter/material.dart';
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List backgroundIcon=[
      "assets/images/nailImage6.png",
      "assets/images/backgroundImage1.jpg",
      "assets/images/backgroundImage2.jpg",
      "assets/images/backgroundImage3.jpg",
      "assets/images/backgroundImage4.jpg",
    ];
    var size=MediaQuery.of(context).size;
    return Container(
      height: 70,
      width: size.width,
      color: Colors.grey.withOpacity(0.3),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for(int index=0;index<backgroundIcon.length;index++)
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("${backgroundIcon[index]}"),fit: BoxFit.fill),
                    border: Border.all(color: Colors.white,width: 1)
                ),
              ),
          ],
        ),
      ),
    );
  }
}
