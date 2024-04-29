import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../bottomsheet/view_bottom/bottomsheet.dart';
import '../controller/auth_controller.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  AuthCon acon = Get.put(AuthCon());
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset(
                      "assets/images/update.png",
                     scale: 4.5,
                      fit: BoxFit.cover,
                    ),
                 ],
               ),
            ),
            SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset('assets/images/username.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],
                        keyboardType: TextInputType.text,
                        controller: acon.userNameCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'User Name',
                          
                          
                        ),
                      ),
                    ),
              
              ]),
                 SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Image.asset('assets/images/email.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                      
                        controller: acon.emailCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Email ID',
                          
                        ),
                      ),
                    ),
              
              ]),
                               SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),

                     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Image.asset('assets/images/mobilenumber.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        keyboardType: TextInputType.number,
                       inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],  
                        controller: acon.mobileCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Mobile Number',
                          
                        ),
                      ),
                    ),
              
              ]),
                               SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),

                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(10),
                                           child: Image.asset('assets/images/gender.png',scale: 3,),
                                         ),
                                         Container(
                            width: 110,
                            // color: Colors.amber,
                            child: ListTile(
                              title: Txt(text: "Male"),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 0,
                                groupValue: acon.val,
                                onChanged: (value) {
                                  setState(() {
                                    acon.val = value!;
                                  });
                                },
                                activeColor: appColor,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            // color: Colors.amber,
                            child: ListTile(
                              title: Txt(text: "Female"),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 1,
                                groupValue: acon.val,
                                onChanged: (value) {
                                  setState(() {
                                    acon.val = value!;
                                  });
                                },
                                activeColor: appColor,
                              ),
                            ),
                          ),]),
                       ),
                
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                              onTap: (){
                               if(acon.userNameCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Your Name");
                              }   else if(acon.emailCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Email Address");
                              }   else if(acon.mobileCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter New Password");
                              }  else if(acon.val == -1) {
                                Fluttertoast.showToast(msg: "Please Select Gender");
                              }
                              else{         
                                  if (_validateEmail(acon.emailCon.text)) {
                                    acon.registerFunc();
                                     } else if( acon.mobileCon.text.length != 10){
                            Fluttertoast.showToast(
                              msg: "Only 10 digits should be entered");
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Enter Valid Email Address");
                        }
                               
                                //  var DoctorID = GetStorage().read('driverId').toString();           
                                //  print('aaaaa'+DoctorID);       ;
                                 }
                              },
                              child: Container(
                                height: mHeight/16,
                                width: mWidth/1.9,
                                decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Txt(text: 'Update',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                
                              ),
                            ),
              ),
              // InkWell(
              //   onTap: (){
              //     Get.to(Bottomsheet());
              //   },
              //   child: Container(
              //                     height: mHeight/16,
              //                     width: mWidth/1.9,
              //                     decoration: BoxDecoration( border: Border.all(color: appColor),borderRadius: BorderRadius.circular(10)),
              //                     child: Center(child: Txt(text: 'Skip',fsize: 16,weight: FontWeight.bold,color: blackColor,)),
              //
              //                   ),
              // ),
          ],
        ),
      ) ,));
  }
  bool _validateEmail(email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(acon.emailCon.text);
  }
}