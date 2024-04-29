import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../auth/controller/auth_controller.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: greyColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(children: [
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,),
                  child:   IconButton(
                    icon: Icon(
                Icons.arrow_back,
                color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                      Txt(text: 'Notification',fsize: 18,weight: FontWeight.w500,),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,size: 30,)),
                      ),
                       ],
                     ),
             ),
                 Container(height: mHeight/1.1,width: mWidth/1.1,
            child: ListView.builder(  physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
         shrinkWrap: true,
         itemCount: 10,
         itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                  height: mHeight/8,
                  width: mWidth/3.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                     color: whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Image.asset('assets/images/dot.png',scale: 2.5,),
                        Txt(text: '4.55 pm',color: darkGreyColor,)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        //Image.asset('assets/images/notifications.png',scale: 3,),
                        Column(children: [
                          Txt(text: 'Artist Thomas podcast is live now. ',weight: FontWeight.w500,fsize: 13,),
                          Txt(text: 'Artist Thomas podcast is live now.',fsize: 13,),
                        ],)
                      ],),
                    ),
                    
                  ]),
                ),
          );
         }), 
            ),
             
        ]),
      ),
    ));
  }
}