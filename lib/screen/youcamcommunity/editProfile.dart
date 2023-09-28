import 'package:flutter/material.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 10),
      //     child: Icon(Icons.arrow_back,color: Colors.black,),
      //   ),
      //   title: Text("notification",style: TextStyle(fontSize: 18,color: Colors.black),),
      //
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.only(left: 10,bottom: 111),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            child: Icon(Icons.arrow_back,color: Colors.white,size: 32,)),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,bottom: 111),
                        child: Text("Save",style: TextStyle(fontSize: 18,color: Colors.white),),

                      ),

                    ],
                  ),
                ),

                Positioned(
                  top:115,
                  child:Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage:  AssetImage("assets/images/mydesignImage.jpg"),
                      ),
                      Positioned(
                        top: 40,
                          right: -15,
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.black.withOpacity(0.6),
                            child: Center(child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 32,)),
                          ))
                    ],
                  )
                )

              ],
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Full Name",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    filled: true,
                    fillColor: Color(0xffCCCCCC).withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Colors.grey,
                            width: 1
                        )
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Email",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter new Email',
                    filled: true,
                    fillColor: Color(0xffCCCCCC).withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Colors.grey,
                            width: 1
                        )
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Password",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0xffCCCCCC).withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Colors.grey,
                            width: 1
                        )
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Phone Number",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    filled: true,
                    fillColor: Color(0xffCCCCCC).withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Colors.grey,
                            width: 1
                        )
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
