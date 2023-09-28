import 'package:artas_nails/screen/youcamcommunity/notification_page.dart';
import 'package:artas_nails/screen/youcamcommunity/payPage.dart';
import 'package:artas_nails/screen/youcamcommunity/userProfilePage.dart';
import 'package:flutter/material.dart';
class YouCameCommunityPage extends StatefulWidget {
  const YouCameCommunityPage({Key? key}) : super(key: key);

  @override
  State<YouCameCommunityPage> createState() => _YouCameCommunityPageState();
}

class _YouCameCommunityPageState extends State<YouCameCommunityPage> {
  
  List icondata=[
    Icons.person,
    Icons.payment,
    Icons.notification_important_rounded,
  ];
  var selectedIndex=0;

  List bodyPage=[
    UserProfilepage(),
    PayPage(),
    NotificationPage()
  ];
  
  
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: size.height*0.1,
        width: size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(int i=0;i<icondata.length;i++)
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=i;
                  });
                },
                  child: Icon(icondata[i],size: 31,color:selectedIndex==i? Colors.redAccent:Colors.grey))
          ],
        ),
      ),
      body: AnimatedSwitcher(
          duration:Duration(
            seconds: 1
          ),
        child: bodyPage[selectedIndex],
      ),
    );
  }
}
