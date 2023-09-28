import 'package:artas_nails/screen/my_design_screen.dart';
import 'package:artas_nails/screen/youcamcommunity/youcamecommunitypage.dart';
import 'package:artas_nails/utils/size_confiq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image(image:AssetImage("assets/images/deshbordBackgroundImage.jpg"),fit: BoxFit.cover,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Center(
                child: Text(
                  "YouCam",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Center(
                child: Text(
                  "Nails",
                  style: TextStyle(fontSize: 50, color: Colors.pink),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/dashboard.jpeg"),
                ),
              ),
              Center(
                child: Text(
                  "Create Nail Designs",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Color(0xfff9b208),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Container(
                              height: 75,
                              width: 75,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                border: Border.all(color: Colors.white,width: 1),
                                image: DecorationImage(image: AssetImage("assets/images/deshboradFunImage.png"))
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text(
                        "Fun Cam",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(MyDesignScreen());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color(0xfff24a95),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("assets/images/mydesignImage.jpg"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          "My Designs",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(YouCameCommunityPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(image: AssetImage("assets/images/dashboard.jpeg"))

                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          "YouCam Community",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
