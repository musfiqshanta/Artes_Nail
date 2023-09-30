import 'package:artas_nails/controller/cameraController/cameraController.dart';
import 'package:artas_nails/screen/dashbord/dashbord_app_bar.dart';
import 'package:artas_nails/utils/nail_shape.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

import '../bottomContainerPage/backgroundContainer.dart';
import '../bottomContainerPage/colorContainer.dart';
import '../bottomContainerPage/nailLookContainer.dart';
import '../bottomContainerPage/shapeContainer/shapeContainer.dart';
import '../bottomContainerPage/shapeContainer/skinContainer.dart';
import 'package:get/get.dart';
import 'dart:math';

class MyDesignScreen extends StatefulWidget {
  const MyDesignScreen({Key? key}) : super(key: key);

  @override
  State<MyDesignScreen> createState() => _MyDesignScreenState();
}

class _MyDesignScreenState extends State<MyDesignScreen> {
  
  
  CameraController controllar = Get.put(CameraController());
  int selectedIndex = 0;
  List<Map> botomIcon = [
    {"icon": "assets/images/colorImage.png", "textName": "Color"},
    {"icon": "assets/images/nail_looksImage.png", "textName": "Nail Looks"},
    {"icon": "assets/images/shape_nail.png", "textName": "Shape"},
    {"icon": "assets/images/SkinImage.png", "textName": "Skin"},
    {"icon": "assets/images/backgroundImage.png", "textName": "Background"}
  ];

  List<Widget> designContainar = [
    ColorContainerPage(),
    NailLooksContainer(),
    ShapeContainer(),
    SkinContainer(),
    BackgroundImage(),
  ];
  int selected = 0;
  List color = [
    Colors.red[800],
    Colors.brown,
    Colors.orange[800],
    Colors.indigo,
    Colors.deepPurple[400],
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("selected");
    print(selected);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 480,
              width: 350,
              child: Indexer(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Indexed(
                      index: 1,
                      child: Container(
                        //constraints: BoxConstraints(maxWidth: 400, maxHeight: 490),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/hand.png'))),
                      ),
                    ),
                    Indexed(
                      index: 0,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 111,
                            left: 25,
                            child: Transform.rotate(
                              angle: 150 * (pi / 180),
                              child: ClipPath(
                                clipper: NailDesign(),
                                child: selected == 0
                                    ? Container(
                                        width:
                                            16, // Adjust the container size as needed
                                        height: 50,
                                        color: color[selectedIndex],
                                      )
                                    : Container(
                                        width:
                                            16, // Adjust the container size as needed
                                        height: 50,
                                        // color: Colors.red,
                                        child: Image.asset(
                                          "assets/images/bg$selectedIndex.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 94,
                            child: Transform.rotate(
                              angle: 170 * (pi / 180),
                              child: ClipPath(
                                clipper: NailDesign(),
                                child: selected == 0
                                    ? Container(
                                        width:
                                            20, // Adjust the container size as needed
                                        height: 50,
                                        color: color[selectedIndex],
                                      )
                                    : Container(
                                        width:
                                            20, // Adjust the container size as needed
                                        height: 50,
                                        child: Image.asset(
                                           "assets/images/bg$selectedIndex.png",
                                          fit: BoxFit
                                              .cover, // Adjust the fit as needed
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 158,
                            child: Transform.rotate(
                              angle: 185 * (pi / 180),
                              child: ClipPath(
                                clipper: NailDesign(),
                                child: selected == 0
                                    ? SizedBox(
                                        width:
                                            21.5, // Adjust the container size as needed
                                        height: 50,
                                        //  color: Colors.red,
                                        child: ColoredBox(
                                            color: color[selectedIndex]),
                                      )
                                    : Container(
                                        width:
                                            21.5, // Adjust the container size as needed
                                        height: 50,
                                        child: Image.asset(
                                           "assets/images/bg$selectedIndex.png",
                                          fit: BoxFit
                                              .cover, // Adjust the fit as needed
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 39,
                            left: 231,
                            child: Transform.rotate(
                              angle: 196 * (pi / 180),
                              child: ClipPath(
                                clipper: NailDesign(),
                                child: selected == 0
                                    ? Container(
                                        width:
                                            21, // Adjust the container size as needed
                                        height: 50,
                                        color: color[selectedIndex],
                                      )
                                    : Container(
                                        width:
                                            21, // Adjust the container size as needed
                                        height: 50,
                                        child: Image.asset(
                                          "assets/images/bg$selectedIndex.png",
                                          fit: BoxFit
                                              .cover, // Adjust the fit as needed
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 194,
                            right: 28,
                            child: Transform.rotate(
                              angle: 225 * (pi / 180),
                              child: ClipPath(
                                clipper: NailDesign(),
                                child: selected == 0
                                    ? Container(
                                        width:
                                            15, // Adjust the container size as needed
                                        height: 50,
                                        color: color[selectedIndex],
                                      )
                                    : Container(
                                        width:
                                            15, // Adjust the container size as needed
                                        height: 50,
                                        child: Image.asset(
                                          "assets/images/bg$selectedIndex.png",
                                          fit: BoxFit
                                              .cover, // Adjust the fit as needed
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Flexible(
                flex: 1,
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex == -1;
                        print("kkk$selectedIndex");
                      });
                    },
                    child: Container(
                        height: 70,
                        width: size.width,
                        color: Colors.grey.withOpacity(0.2),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              child: Container(
                                height: 75,
                                width: 75,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/nailPalisImage.png"))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "PERFECT",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
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
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedIndex != -index) {
                                            selectedIndex = index;
                                          } else {
                                            selectedIndex == index;
                                          }
                                        });
                                        if (kDebugMode) {
                                          print("INDEX__$selectedIndex");
                                        }
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: selected == 0
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: color[index],
                                                      border: selectedIndex ==
                                                              index
                                                          ? Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 3)
                                                          : Border.all(
                                                              color: color[
                                                                  index])),
                                                )
                                              : Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/bg$index.png"),
                                                          fit: BoxFit.cover),
                                                      border: selectedIndex ==
                                                              index
                                                          ? Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 3)
                                                          : Border.all(
                                                              color:Colors.transparent
                                                              
                                                              )),
                                                )),
                                    );
                                  }),
                            ),
                          ],
                        )),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        height: 80,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int index = 0; index < botomIcon.length; index++)
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = index;
                      print("6666$selected");
                    });
                  },
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage("${botomIcon[index]["icon"]}"),
                          height: 30,
                          width: 30,
                          color: selected == index
                              ? Colors.redAccent
                              : Colors.grey),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${botomIcon[index]["textName"]}",
                        style: TextStyle(
                            fontSize: 13,
                            color: selected == index
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                )
            ],

            // children: [
            //   Text("Color"),
            //   Text("Nail Looks"),
            //   Text("Shape"),
            //   Text("Skin"),
            //   Text("Background"),
            //
            // ],
          ),
        ),
      ),
    );
  }
}
