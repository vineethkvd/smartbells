import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smartbells/view/auth/controller/auth_controller.dart';
import 'package:smartbells/view/auth/view_auth/otp.dart';
import 'package:smartbells/view/auth/view_auth/password.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';

class mobileNumber extends StatefulWidget {
  const mobileNumber({super.key});

  @override
  State<mobileNumber> createState() => _mobileNumberState();
}

class _mobileNumberState extends State<mobileNumber> {

  @override
  Widget build(BuildContext context) {
    AuthCon acon = Get.put(AuthCon());
    return SafeArea(child: Scaffold(
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
      body:SingleChildScrollView(
        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(
                    "assets/images/Smart-Bells.png",
                    //width: 230,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
               ],
             ),
             Container(
              width: 350,
               child: TextField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              controller: acon.mobileCon,
                              decoration: InputDecoration(
                                  // fillColor: whiteColor,
                                  // filled: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Enter Mobile Number',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: blackColor, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: blackColor, width: 1),
                                  )),
                            ),
             ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                              onTap: (){
                               
                                   if(acon.mobileCon.text.isEmpty || acon.mobileCon.text.length < 10){                        
                                Fluttertoast.showToast(msg: "Please Valid Mobile Number");}
                                else{     
                                  acon.loginFunc();  
                                  //  var DoctorID = GetStorage().read('driverId').toString();           
                                  //  print('aaaaa'+DoctorID);       ;
                                   }
                              },
                              child: Container(
                                height: mHeight/16,
                                width: mWidth/1.7,
                                decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(8)),
                                child: Center(child: Txt(text: 'Get OTP',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                
                              ),
                            ),
              ),
          ],
        ),
      ) ,));
  }
}