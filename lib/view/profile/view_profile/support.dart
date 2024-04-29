import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/bottomsheet.dart';
import 'package:smartbells/view/profile/controller/profile_controller.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  ProfileCon pcon = Get.put(ProfileCon());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: greyColor,
      body: Column(children: [
                  Row(
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              onPressed: () => Get.back(),
                  ),
              ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Txt(text: 'Support',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: whiteColor,borderRadius: BorderRadiusDirectional.circular(12)),
                                            height: mHeight / 6,
                                            width: mWidth / 1.1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 8,bottom: 8,left: 20,right: 20),
                                              child: TextFormField(
                                                controller: pcon.supportCon,
                                                textAlign: TextAlign.justify,
                                                maxLines: 10,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                    ],
                  ),
                  SizedBox(height: 20),
                   InkWell(
                    onTap: ()async{
                      if(pcon.supportCon.text.isEmpty){
                        Fluttertoast.showToast(msg: "");
                      } else {
                        await pcon.supportFunc();
                        pcon.supportCon.clear();
                      _showAlertDialog();
                      }
                      
                    },
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                                    height: mHeight/18,
                                    width: mWidth/2.3,
                                    decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(10)),
                                    child: Center(child: Txt(text: 'Save',fsize: 16,weight: FontWeight.w500,color: whiteColor,)),
                                    
                                  ),
                     ),
                   ),
            
      ]),
    ),);
  }

    Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: Image.asset(
            'assets/images/success.png',
            height: 40,
          ),
          content: Container(
              height: mHeight / 30,
              child: Center(child: Text('Complaint sent successfully'))),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: Container(
                  height: mHeight / 25,
                  width: mWidth / 3.5,
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Txt(
                      text: 'ok',
                      color: whiteColor,
                      fsize: 16,
                      weight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}