import 'package:flutter/material.dart';
class NailLooksContainer extends StatefulWidget {
  const NailLooksContainer({Key? key}) : super(key: key);

  @override
  State<NailLooksContainer> createState() => _NailLooksContainerState();
}

class _NailLooksContainerState extends State<NailLooksContainer> {
  @override
  Widget build(BuildContext context) {
    int selecetIndex=0;
    List<Map> nailIcon=[
      {
        "icon":"assets/images/nailImage6.png",
        "textName":""
      },
      {
        "icon":"assets/images/nailImage1.png",
        "textName":"Show Glow"
      },

      {
        "icon":"assets/images/nailImage2.png",
        "textName":"Rose Gold"
      },

      {
        "icon":"assets/images/nailImage3.png",
        "textName":"Blossom"
      },

      {
        "icon":"assets/images/nailImage4.png",
        "textName":"Glitzy"
      },

      {
        "icon":"assets/images/nailImage5.png",
        "textName":"Venus"
      }

    ];
    var size=MediaQuery.of(context).size;
      return Container(
        height: 70,
        width: size.width,
        color: Colors.grey.withOpacity(0.3),
        child:Stack(
          children: [
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: nailIcon.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child:Column(
                        children: [
                          Image(image: AssetImage("${nailIcon[index]["icon"]}"),
                              height: 45,width: 45,
                              ),
                          Text("${nailIcon[index]["textName"]}",style: TextStyle(fontSize: 14,color: Colors.white),),
                        // Container(
                        //   height: 2,
                        //   width: 30,
                        //   decoration: BoxDecoration(
                        //     borderRadius:BorderRadius.circular(51),
                        //     color:selecetIndex==index?Colors.redAccent:Colors.transparent
                        //   ),
                        // )
                        ],
                      ),

                  ) ;
                }),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            //   child: Container(
            //     height: 45,
            //     width: 45,
            //    decoration: BoxDecoration(
            //      shape: BoxShape.circle,
            //      color: Colors.white,
            //    ),
            //     child: Center(child: Icon(Icons.file_download_rounded,color: Colors.black,size: 31),)
            //
            //     // Column(
            //     //   children: [
            //     //     Expanded(child:
            //     //     Image(image: AssetImage("assets/images/nailPalisImage.png"))),
            //     //     SizedBox(height: 5,),
            //     //     Text("PERFECT",style: TextStyle(fontSize: 12,color: Colors.grey),)
            //     //   ],
            //     // ),
            //
            //
            //   ),
            // ),
          ],
        )


    );
  }
}
