import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        title: Text("Notification",style: TextStyle(fontSize: 18,color: Colors.black),),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Center(child: Text("Clear all",style: TextStyle(fontSize: 12,color: Colors.blue),)),
          // ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            elevation: 5,
          child:  Center(
            child: ListTile(

                  title: Text("8.15 PM",style: TextStyle(fontSize: 14,color: Colors.black),),
                  subtitle:  Text("You have a new Follower",style: TextStyle(fontSize: 14,color: Colors.black),),
                 trailing: CircleAvatar(
                   radius: 22,
                   backgroundImage: AssetImage("assets/images/men.jpeg"),
                 ),

              ),
          )),
        ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
                elevation: 5,
                child:  Center(
                  child: ListTile(

                    title: Text("8.15 PM",style: TextStyle(fontSize: 14,color: Colors.black),),
                    subtitle:  Text("You have a new Follower",style: TextStyle(fontSize: 14,color: Colors.black),),
                    trailing: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/images/men.jpeg"),
                    ),

                  ),
                )),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
                elevation: 5,
                child:  Center(
                  child: ListTile(

                    title: Text("8.15 PM",style: TextStyle(fontSize: 14,color: Colors.black),),
                    subtitle:  Text("You have a new Follower",style: TextStyle(fontSize: 14,color: Colors.black),),
                    trailing: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/images/men.jpeg"),
                    ),

                  ),
                )),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
                elevation: 5,
                child:  Center(
                  child: ListTile(

                    title: Text("8.15 PM",style: TextStyle(fontSize: 14,color: Colors.black),),
                    subtitle:  Text("You have a new Follower",style: TextStyle(fontSize: 14,color: Colors.black),),
                    trailing: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/images/men.jpeg"),
                    ),

                  ),
                )),
          ),
        ],
      ),

    );
  }
}
