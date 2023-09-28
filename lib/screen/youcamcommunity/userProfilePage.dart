import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'editProfile.dart';
class UserProfilepage extends StatelessWidget {
  const UserProfilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: size.height*0.30,
                decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.2),
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(90),bottomRight: Radius.circular(90))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 90),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.arrow_back,color: Colors.white,size: 32,)),

                    ),
                    InkWell(
                      onTap: (){
                        Get.to(EditProfile());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10,bottom: 90),
                        child: Icon(Icons.edit_outlined,color: Colors.white,size: 32,),

                      ),
                    ),

                  ],
                ),
              ),
              
              Positioned(
                top:115,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage:  AssetImage("assets/images/men.jpeg"),
                ),
              )

            ],
          ),
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.person,size: 25,color: Colors.grey,),
            title: Text("Abir Hasan",style: TextStyle(fontSize: 18,color: Colors.black),),
          ),
          Divider(indent: 20,endIndent: 10,thickness: 1,),
          ListTile(
            leading: Icon(Icons.phone,size: 25,color: Colors.grey,),
            title: Text("01315054794",style: TextStyle(fontSize: 18,color: Colors.black),),
          ),
          Divider(indent: 20,endIndent: 10,thickness: 1,),
          ListTile(
            leading: Icon(Icons.email,size: 25,color: Colors.grey,),
            title: Text("abiruodacse@gmail.com",style: TextStyle(fontSize: 18,color: Colors.black),),
          ),
          Divider(indent: 20,endIndent: 10,thickness: 1,),

        ],
      ),
    );
  }
}
