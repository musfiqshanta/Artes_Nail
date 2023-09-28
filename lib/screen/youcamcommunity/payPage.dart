import 'package:flutter/material.dart';
class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff8efeb),
      body: SafeArea (
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    // Image.asset(
                    //   "assets/home_Graph.png",
                    //   height: 150,
                    //   width: size.width,
                    //   fit: BoxFit.fill,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Make your payment",
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 8,
                                activeTrackColor: Color(0xff00C851),
                                thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 0.0),
                                overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 0.0),
                              ),
                              child: Slider(
                                  value: 1,
                                  activeColor: Color(0xff00C851),
                                  inactiveColor: Color(0xff00C851).withOpacity(0.2),
                                  onChanged: (val) {}),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Billing Information", style: TextStyle(fontSize: 20, color: Colors.black),),
                ),
                SizedBox(height: 20),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){

                          setState(() {
                            // selectedRadioButton = index;
                          });
                        },
                        child: Padding(

                            padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                //set border radius more than 50% of height and width to make circle
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 10),
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration:  BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:Border.all(
                                              width: 2,
                                              color: Colors.black.withOpacity(0.2))

                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 22,
                                          width: 22,
                                          decoration:  BoxDecoration(
                                            shape: BoxShape.circle,
                                            // color: selectedRadioButton==index?Colors.blue:null,


                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 8,),
                                        Text("Michelangelo Flores"),
                                        SizedBox(height: 8,),
                                        Text("0989975432", style: TextStyle(color: Colors.black.withOpacity(0.4)),),
                                        SizedBox(height: 8,),
                                        Text("658 Yost Island Apt, Seattle, US", style: TextStyle(color: Colors.black.withOpacity(0.4)),),
                                        SizedBox(height: 8,),
                                      ],
                                    ),
                                  ),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle, color: Colors.grey,))
                                ],
                              ),
                            )
                        ),
                      );
                    }),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(onPressed: (){}, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle_outlined, color: Colors.black.withOpacity(0.7),),
                              SizedBox(height:10,),
                              Text("Billing Address", style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.7)
                              ),)
                            ],
                          ),

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white

                            ),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height*0.09,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Select a card", style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 15),

                Container(

                  height: 70,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffF0F2F6)
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(


                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        height: 60,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/images/visa-pay-logo(1.png")),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/images/paypal-logo.png")),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/images/mastercard-logo.png")),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(onPressed: (){}, child: Text("Card Number", style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),),

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff7F8186)

                            ),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(onPressed: (){}, child: Text("EXP Date", style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),),

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff7F8186)

                            ),),
                        ),
                      ),
                      SizedBox(width: 35,),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(onPressed: (){}, child: Text("Zip Code", style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),),

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff7F8186)

                            ),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Processing fee",style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),),
                      Text("${15.99}",style: TextStyle(
                          color: Colors.black
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Sub total",style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),),
                      Text("${15.99}",style: TextStyle(
                          color: Colors.black
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total",style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                      Text("${15.99}",style: TextStyle(
                          color: Colors.black
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                  child: Container(
                    height: size.height*0.1,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.cyanAccent.withOpacity(0.5)
                    ),
                    child: Center(
                      child:  Text("Payment",style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                )



                // SizedBox(height: 15),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: SizedBox(
                //           height: 50,
                //           child: ElevatedButton(onPressed: ()async{
                //             //newRout(context, TermsCondition());
                //
                //             if(controller.linkIndex==0){
                //               final file=   await controller.writeJson(controller.expertItModel!, "expert.json");
                //
                //               print(file);
                //               controller.sendMail(file, "expert");
                //             }
                //             if(controller.linkIndex==1){
                //               final file=   await controller.writeJsonBata(controller.bataModel!, "bata.json", "json");
                //
                //               print(file);
                //               controller.sendMail(file, "bata").then((value){
                //                 newRout(context, SuccessPage());
                //               });
                //
                //             }
                //
                //             if(controller.linkIndex==2){
                //               final file=   await controller.writeJsonAmazon(controller.amazonModel!, "amazon.json");
                //
                //               print(file);
                //               controller.sendMail(file, "Amazon").then((value){
                //                 newRout(context, SuccessPage());
                //               });
                //
                //             }
                //
                //             if(controller.linkIndex==3){
                //               final file=   await controller.writeJsonEbay(controller.ebayModel!, "eBay.json");
                //
                //               print(file);
                //               controller.sendMail(file, "Ebay").then((value){
                //                 newRout(context, SuccessPage());
                //               });
                //
                //             }
                //             if(controller.linkIndex==4){
                //               final file=   await controller.writeJsonYelp(controller.franciscoModel!, "yelp.json");
                //
                //               print(file);
                //               controller.sendMail(file, "Yelp").then((value){
                //                 newRout(context, SuccessPage());
                //               });
                //             }
                //           }, child: Text("Complete Payment", style: TextStyle(
                //               fontSize: 18,
                //               color: Colors.white
                //           ),),
                //
                //             style: ElevatedButton.styleFrom(
                //                 backgroundColor:Color(0xff0049FF)
                //
                //             ),),
                //         ),
                //       )
                //     ],
                //   ),
                // ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
