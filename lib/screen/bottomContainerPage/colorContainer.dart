import 'package:flutter/material.dart';
class ColorContainerPage extends StatelessWidget {
  final int? selected;
  const ColorContainerPage({super.key,this.selected});


  @override
  Widget build(BuildContext context) {
    List color=[
      Colors.pink ,
      Colors.red,
      Colors.orange,
      Colors.indigo,
      Colors.deepPurple,

    ];
    var size=MediaQuery.of(context).size;
    return Container(
      height: 70,
      width: size.width,
      color: Colors.grey.withOpacity(0.2),
      child:Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
            child: Container(
              height: 75,
              width: 75,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child:
                  Image(image: AssetImage("assets/images/nailPalisImage.png"))),
                  SizedBox(height: 5,),
                  Text("PERFECT",style: TextStyle(fontSize: 12,color: Colors.grey),)
                ],
              ),


            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: color.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                     // print("INDEX__$index");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color[index],
                            border: Border.all(color: Colors.white,width: 1)
                        ),
                      ),
                    ),
                  ) ;
                }),
          ),


        ],
      )


    );
  }
}
