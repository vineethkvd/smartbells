import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../common/base_colors.dart';
import '../../../../common/text.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../../bottomsheet/view_bottom/bottomsheet.dart';
import '../../controller/profile_controller.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  AuthCon acon = Get.put(AuthCon());
  ProfileCon pcon = Get.put(ProfileCon());
  @override
  void initState() {
    call();
    
    super.initState();
    
  }

  call()async{
    await pcon.profileFunc();
    pcon.profiledata?.data.userGender == "male"? pcon.val= 0: pcon.val=1;
    setState(() {
      
    });
  }
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
                        controller: pcon.userNameCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'User Name'.tr,
                          
                          
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
                      
                        controller: pcon.emailCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Email ID'.tr,
                          
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
                        controller: pcon.mobilesCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Mobile Number'.tr,
                          
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
                              title: Txt(text: "Male".tr),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 0,
                                groupValue: pcon.val,
                                onChanged: (value) {
                                  setState(() {
                                    
                                    pcon.val = value!;
                                    print(pcon.val);
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
                              title: Txt(text: "Female".tr),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 1,
                                groupValue: pcon.val,
                                onChanged: (value) {
                                  setState(() {
                                    pcon.val = value!;
                                    print(pcon.val);
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
                               if(pcon.userNameCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Your Name");
                              }   else if(pcon.emailCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Email Address");
                              }   else if(pcon.mobilesCon.text.isEmpty && pcon.mobileCon.text.length > 10){
                                Fluttertoast.showToast(msg: "Please Enter Mobile ");
                              }  else if(pcon.val == -1) {
                                Fluttertoast.showToast(msg: "Please Select Gender");
                              }
                              else{         
                                  if (_validateEmail(pcon.emailCon.text)) {
                           pcon.updateFunc();
                        } else if(pcon.mobileCon.text.length > 10){
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
                                height: mHeight/18,
                                width: mWidth/1.6,
                                decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Txt(text: 'Save'.tr,fsize: 16,weight: FontWeight.w500,color: whiteColor,)),
                                
                              ),
                            ),
              ),
             
          ],
        ),
      ) ,));
  }
  bool _validateEmail(email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(pcon.emailCon.text);
  }
}