import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbells/view/auth/view_auth/mobile_number.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';

class welcome2 extends StatefulWidget {
  const welcome2({super.key});

  @override
  State<welcome2> createState() => _welcome2State();
}

class _welcome2State extends State<welcome2> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return Container( decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/welcome.png",
                ),
                fit: BoxFit.cover)),
                child: SafeArea(
                  child: Scaffold(
                       appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                       icon: Icon(Icons.arrow_back_rounded,
                       size: 40,
                       color: blackColor,)),),
                    backgroundColor: Colors.transparent,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Txt(text: 'Lorem ipsum',color: whiteColor,fsize: 24,weight: FontWeight.bold,)],),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              
                              children: [Txt(text: "Lorem  ipsum  dolor  sit  amet consectetur adipiscing elit.        Duis elitsapien, convallis vel enim sit amet egestas commodo arcu",color: whiteColor,)]),
                          ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: InkWell(
                          onTap: (){
                            Get.to(() => mobileNumber());
                          },
                          child: Container(
                            height: mHeight/16,
                            width: mWidth/1.1,
                            decoration: BoxDecoration(  color: whiteColor,borderRadius: BorderRadius.circular(8)),
                            child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,)),
                            
                          ),
                        ),
                      )]),
                    ),
                ));
  }
}