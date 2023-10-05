import 'package:artas_nails/controller/cameraController/cameraController.dart';
import 'package:artas_nails/firebase/firebase.dart';
import 'package:artas_nails/screen/dashbord/dashbord_app_bar.dart';
import 'package:artas_nails/screen/mydesign/main_screen.dart';
import 'package:artas_nails/utils/image_picker_controller.dart';
import 'package:artas_nails/utils/nail_shape.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyDesignScreen extends StatefulWidget {
  const MyDesignScreen({Key? key}) : super(key: key);

  @override
  State<MyDesignScreen> createState() => _MyDesignScreenState();
}

class _MyDesignScreenState extends State<MyDesignScreen> {
  CameraController controllar = Get.put(CameraController());
  final firebaseController = Get.put(FirebaseController());
  final imagepickerController = Get.put(ImagePick());

  int selected = 0;
  int selectedIndex = 0;
  int stickerSelect = -1;
  RxInt nailTap = 0.obs;
  List<Map> botomIcon = [
    {"icon": "assets/images/colorImage.png", "textName": "Color"},

    {"icon": "assets/images/nail_looksImage.png", "textName": "Nail Looks"},
    //{"icon": "assets/images/shape_nail.png", "textName": "Shape"},
    {"icon": "assets/images/SkinImage.png", "textName": "Skin"},
    {"icon": "assets/images/butterfly.png", "textName": "Sticker"},
    {"icon": "assets/images/backgroundImage.png", "textName": "Background"}
  ];

  List<Widget> designContainar = [
    ColorContainerPage(),
    NailLooksContainer(),
    ShapeContainer(),
    SkinContainer(),
    BackgroundImage(),
  ];

  // List<Color> listColor = [Colors.red, Colors.green, Color(0xffaaa)];
  List color = [
    Colors.red[800],
    Colors.brown,
    Colors.orange[800],
    Colors.indigo,
    Colors.deepPurple[400],
  ];
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  final user = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("selected");
    print(selected);
    var container = Container(
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
                    selectedIndex = 0;
                    print("6666$selected");
                  });
                },
                child: Column(
                  children: [
                    Image(
                        image: AssetImage("${botomIcon[index]["icon"]}"),
                        height: 30,
                        width: 30,
                        color:
                            selected == index ? Colors.redAccent : Colors.grey),
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
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StreamBuilder(
                stream: user
                    .doc(auth!.uid)
                    .collection('imageAndColor')
                    .doc('setColorAndImage')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  var fingerColor = snapshot.data!['color'][0];
                  var fingerImage = snapshot.data!['image'][0];
                  var stickerImage;
                  if (stickerSelect > -1) {
                    stickerImage = snapshot.data!['sticker'][stickerSelect];
                  }

                  if (selected == 0) {
                    fingerColor = snapshot.data!['color'][selectedIndex];
                  } else if (selected == 1) {
                    fingerImage = snapshot.data!['image'][selectedIndex];
                  }

                  return SizedBox(
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
                                      image: AssetImage(
                                          'assets/images/hand.png'))),
                            ),
                          ),
                          Indexed(
                            index: 0,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 326,
                                  left: 24,
                                  child: Transform.rotate(
                                    angle: 150 * (pi / 180),
                                    child: SizedBox(
                                      width: 16,
                                      height: 40,
                                      child: ClipPath(
                                        clipper: NailDesign(),
                                        child: selected == 0
                                            ? Stack(children: [
                                                Container(
                                                  width:
                                                      16, // Adjust the container size as needed
                                                  height: 50,
                                                  color: Color(
                                                      int.parse(fingerColor)),
                                                ),
                                                stickerSelect > -1
                                                    ? Positioned(
                                                        top: 10,
                                                        right: 0,
                                                        child: Transform.rotate(
                                                          angle: 60 * pi / 180,
                                                          child: Image.network(
                                                            stickerImage,
                                                            width: 30,
                                                            fit: BoxFit.contain,
                                                            // Adjust the fit as needed
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                              ])
                                            : Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        16, // Adjust the container size as needed
                                                    height: 50,
                                                    // color: Colors.red,
                                                    child: Image.network(
                                                      fingerImage,
                                                      fit: BoxFit
                                                          .cover, // Adjust the fit as needed
                                                    ),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                60 * pi / 180,
                                                            child:
                                                                Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit
                                                                  .contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 404,
                                  left: 94,
                                  child: Transform.rotate(
                                    angle: 170 * (pi / 180),
                                    child: SizedBox(
                                      height: 40,
                                      width: 20,
                                      child: ClipPath(
                                        clipper: NailDesign(),
                                        child: selected == 0
                                            ? Stack(children: [
                                                Container(
                                                  width:
                                                      20, // Adjust the container size as needed
                                                  height: 50,
                                                  color: Color(
                                                      int.parse(fingerColor)),
                                                ),
                                                stickerSelect > -1
                                                    ? Positioned(
                                                        top: 10,
                                                        right: 0,
                                                        child: Transform.rotate(
                                                          angle: 60 * pi / 180,
                                                          child: Image.network(
                                                            stickerImage,
                                                            width: 30,
                                                            fit: BoxFit.contain,
                                                            // Adjust the fit as needed
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                              ])
                                            : Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        20, // Adjust the container size as needed
                                                    height: 50,
                                                    child: Image.network(
                                                      fingerImage,
                                                      fit: BoxFit
                                                          .cover, // Adjust the fit as needed
                                                    ),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                170 * pi / 180,
                                                            child:
                                                                Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit
                                                                  .contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 425,
                                  left: 159,
                                  child: Transform.rotate(
                                    angle: 185 * (pi / 180),
                                    child: SizedBox(
                                      width: 21,
                                      height: 40,
                                      child: ClipPath(
                                        clipper: NailDesign(),
                                        child: selected == 0
                                            ? Stack(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        21.5, // Adjust the container size as needed
                                                    height: 50,
                                                    //  color: Colors.red,
                                                    child: ColoredBox(
                                                        color: Color(int.parse(
                                                            fingerColor))),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                60 * pi / 180,
                                                            child:
                                                                Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit
                                                                  .contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              )
                                            : Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        21.5, // Adjust the container size as needed
                                                    height: 50,
                                                    child: Image.network(
                                                      fingerImage,
                                                      fit: BoxFit
                                                          .cover, // Adjust the fit as needed
                                                    ),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                60 * pi / 180,
                                                            child:
                                                                Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit
                                                                  .contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 398,
                                  left: 232,
                                  child: Transform.rotate(
                                    angle: 196 * (pi / 180),
                                    child: SizedBox(
                                      width: 20,
                                      height: 40,
                                      child: ClipPath(
                                        clipper: NailDesign(),
                                        child: selected == 0
                                            ? Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        21, // Adjust the container size as needed
                                                    height: 50,
                                                    color: Color(
                                                        int.parse(fingerColor)),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                60 * pi / 180,
                                                            child:
                                                                Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit
                                                                  .contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              )
                                            : Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        21, // Adjust the container size as needed
                                                    height: 50,
                                                    child: Image.network(
                                                      fingerImage,
                                                      fit: BoxFit
                                                          .cover, // Adjust the fit as needed
                                                    ),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                60 * pi / 180,
                                                            child:
                                                                Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit
                                                                  .contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 242,
                                  right: 28,
                                  child: Transform.rotate(
                                    angle: 225 * (pi / 180),
                                    child: SizedBox(
                                      height: 40,
                                      width: 16,
                                      child: ClipPath(
                                        clipper: NailDesign(),
                                        child: selected == 0
                                            ? Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        15, // Adjust the container size as needed
                                                    height: 50,
                                                    color: Color(
                                                        int.parse(fingerColor)),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child: Transform.rotate(
                                                            angle: 60 * pi / 180,
                                                            child: Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit.contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              )
                                            : Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        15, // Adjust the container size as needed
                                                    height: 50,
                                                    child: Image.network(
                                                      fingerImage,
                                                      fit: BoxFit
                                                          .cover, // Adjust the fit as needed
                                                    ),
                                                  ),
                                                  stickerSelect > -1
                                                      ? Positioned(
                                                          top: 10,
                                                          right: 0,
                                                          child: Transform.rotate(
                                                            angle: 60 * pi / 180,
                                                            child: Image.network(
                                                              stickerImage,
                                                              width: 30,
                                                              fit: BoxFit.contain,
                                                              // Adjust the fit as needed
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 111,
                                  left: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      nailTap.value = 1;
                                    },
                                    child: SizedBox(
                                        height: 50,
                                        width: 30,
                                        child: ColoredBox(
                                            color: Colors.transparent)),
                                  ),
                                ),
                                Positioned(
                                  top: 30,
                                  left: 88,
                                  child: GestureDetector(
                                    onTap: () {
                                      nailTap.value = 2;
                                    },
                                    child: SizedBox(
                                        height: 50,
                                        width: 30,
                                        child: ColoredBox(
                                            color: Colors.transparent)),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 154,
                                  child: GestureDetector(
                                    onTap: () {
                                      nailTap.value = 3;
                                    },
                                    child: SizedBox(
                                        height: 50,
                                        width: 30,
                                        child: ColoredBox(
                                            color: Colors.transparent)),
                                  ),
                                ),
                                Positioned(
                                  top: 39,
                                  left: 231,
                                  child: GestureDetector(
                                    onTap: () {
                                      nailTap.value = 4;
                                    },
                                    child: SizedBox(
                                        height: 50,
                                        width: 30,
                                        child: ColoredBox(
                                            color: Colors.transparent)),
                                  ),
                                ),
                                Positioned(
                                  top: 197,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      nailTap.value = 5;
                                    },
                                    child: SizedBox(
                                        height: 50,
                                        width: 30,
                                        child: ColoredBox(
                                            color: Colors.transparent)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  );
                }),
            itemsSelection(size),
          ],
        ),
      ),
      bottomNavigationBar: container,
    );
  }

  Flexible itemsSelection(Size size) {
    return Flexible(
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    selected == 0
                        ? Expanded(
                            child: StreamBuilder(
                                stream: user
                                    .doc(auth!.uid)
                                    .collection('imageAndColor')
                                    .doc('setColorAndImage')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  final data = snapshot.data;
                                  print(data!['color'].length);
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        //  print(data!["color"][0]);

                                        // String colors="Color(0xff443a49)" ;

                                        // String substing=colors.substring(6,16);
                                        // print(substing);
                                        ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: data['color'].length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectedIndex !=
                                                          -index) {
                                                        selectedIndex = index;
                                                      } else {
                                                        selectedIndex == index;
                                                      }
                                                    });
                                                    if (kDebugMode) {
                                                      print(
                                                          "INDEX__$selectedIndex");
                                                    }
                                                  },
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(int
                                                                    .parse(data[
                                                                            'color']
                                                                        [
                                                                        index])),
                                                                border: selectedIndex ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            3)
                                                                    : Border
                                                                        .all(
                                                                        color:
                                                                            Color(
                                                                          int.parse(data['color']
                                                                              [
                                                                              index]),
                                                                        ),
                                                                      )),
                                                      )));
                                            }),

                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.amber),
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        title: "Add Your Color",
                                                        content: ColorPicker(
                                                          //enableAlpha: false,
                                                          displayThumbColor:
                                                              true,

                                                          pickerColor:
                                                              pickerColor,
                                                          onColorChanged:
                                                              ((value) {
                                                            print('color');
                                                            print(value);
                                                            pickerColor = value;
                                                          }),
                                                        ),
                                                        confirm: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        pickerColor),
                                                            onPressed: () {
                                                              firebaseController
                                                                  .addColor(
                                                                      pickerColor);

                                                              //Get.back();
                                                            },
                                                            child: Text(
                                                                "Add Color")));

                                                    print(
                                                        "picker colors value");
                                                    print(pickerColor);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: 30,
                                                    weight: 20,
                                                  )),
                                            )),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        : selected == 1
                            ? StreamBuilder(
                                stream: user
                                    .doc(auth!.uid)
                                    .collection('imageAndColor')
                                    .doc('setColorAndImage')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  final data = snapshot.data;
                                  // print(data!['color'].length);
                                  return Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ListView.builder(
                                              shrinkWrap: true,
                                              primary: false,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: data!['image'].length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectedIndex !=
                                                          -index) {
                                                        selectedIndex = index;
                                                      } else {
                                                        selectedIndex == index;
                                                      }
                                                    });
                                                    if (kDebugMode) {
                                                      print(
                                                          "INDEX__$selectedIndex");
                                                    }
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        data['image']
                                                                            [
                                                                            index]),
                                                                    fit: BoxFit
                                                                        .cover),
                                                                border: selectedIndex ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .transparent)),
                                                          )),
                                                    ],
                                                  ),
                                                );
                                              }),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.amber),
                                                ),
                                                child: IconButton(
                                                    onPressed: () {
                                                      imagepickerController
                                                          .pickNailLooks(
                                                              'image');
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                      size: 30,
                                                      weight: 20,
                                                    )),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                            : selected == 3
                                ? StreamBuilder(
                                    stream: user
                                        .doc(auth!.uid)
                                        .collection('imageAndColor')
                                        .doc('setColorAndImage')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return CircularProgressIndicator();
                                      }
                                      final data = snapshot.data;
                                      // print(data!['color'].length);
                                      return Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  primary: false,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      data!['sticker'].length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          print("index $index");
                                                          if (stickerSelect !=
                                                              index) {
                                                            stickerSelect =
                                                                index;
                                                          } else if (stickerSelect ==
                                                              index) {
                                                            print(
                                                                'sticker gone');
                                                            stickerSelect = -1;
                                                          }

                                                          print(stickerSelect);
                                                        });
                                                        if (kDebugMode) {
                                                          print(
                                                              "INDEX__$selectedIndex");
                                                        }
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        5),
                                                            child: Container(
                                                              height: 50,
                                                              width: 50,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                          data['sticker']
                                                                              [
                                                                              index]),
                                                                      fit: BoxFit
                                                                          .cover),
                                                                  border: selectedIndex ==
                                                                          index
                                                                      ? Border.all(
                                                                          color: Colors
                                                                              .white,
                                                                          width:
                                                                              3)
                                                                      : Border.all(
                                                                          color:
                                                                              Colors.transparent)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.amber),
                                                    ),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          imagepickerController
                                                              .pickNailLooks(
                                                                  'sticker');
                                                        },
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                          size: 30,
                                                          weight: 20,
                                                        )),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : SizedBox.shrink()
                  ],
                )),
          ),
        ));
  }
}
