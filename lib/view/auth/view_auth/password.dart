import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../controller/auth_controller.dart';
import 'update.dart';

class passowrd extends StatefulWidget {
  const passowrd({super.key});

  @override
  State<passowrd> createState() => _passowrdState();
}

class _passowrdState extends State<passowrd> {
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
                    "assets/images/password.png",
                   scale: 4,
                    fit: BoxFit.cover,
                  ),
               ],
             ),
             SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Image.asset('assets/images/key.png',scale: 3,),
                  ),

                  //
                  
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: acon.isObscure,
                        controller: acon.newPassCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'New Password',
                           suffixIcon: IconButton(
                          icon: Icon(
                            acon.isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              acon.isObscure = !acon.isObscure;
                            });
                          }),
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
                    child: Image.asset('assets/images/key.png',scale: 3,),
                  ),

                  //
                  
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: acon.isObscure1,
                        controller: acon.confirmPassCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Confirm Password',
                           suffixIcon: IconButton(
                          icon: Icon(
                            acon.isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              acon.isObscure1 = !acon.isObscure1;
                            });
                          }),
                        ),
                      ),
                    ),
              
              ]),
                               SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                              onTap: (){
                               if(acon.newPassCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Enter New Password");
                               } else if(acon.confirmPassCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Enter Confirm Password");
                               }else if(acon.newPassCon.text != acon.confirmPassCon.text){                        
                                Fluttertoast.showToast(msg: "New Password and Confirm Password should be same");
                                }
                                else{         
                                  Get.to(() => update()); 
                      
                                   acon.newPassCon.clear();
                                   acon.confirmPassCon.clear();
                                  //  var DoctorID = GetStorage().read('driverId').toString();           
                                  //  print('aaaaa'+DoctorID);       ;
                                   }
                              },
                              child: Container(
                                height: mHeight/16,
                                width: mWidth/1.7,
                                decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(8)),
                                child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                
                              ),
                            ),
              ),
          ],
        ),
      ) ,));
  }
}