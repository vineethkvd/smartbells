import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:smartbells/view/auth/view_auth/password.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/bottomsheet.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../controller/auth_controller.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold( 
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                  onPressed: () => Get.back(),
                  ),
                ],),
            ),
              Image.asset('assets/images/otp.png',scale: 3.75,),
               Padding(
                 padding: const EdgeInsets.all(23.0),
                 child: Row(
                  children: [
                  Txt(text:'Enter Your Code',fsize: 18,weight: FontWeight.w500,)
                           ],),
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                        width: mWidth / 1.2,
                        //color: greyColor,
                        child: Pinput(
                        controller: acon.otpCon,
                        length: 6,
                        toolbarEnabled: false,
                        inputFormatters: [],
                       )
                      ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Txt(text: 'We Have sent OTP to Your Mobile', 
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 10),
                          child: InkWell(
                            onTap: (){
                              //Get.to(() => Login());
                                   if(acon.otpCon.text.isEmpty || acon.otpCon.text.length < 6){                        
                            Fluttertoast.showToast(msg: "Please Valid OTP");}
                            else{
                              if(acon.otpCon.text==acon.logindata!.data![0].userOtp) {
                                acon.storage.write('userId', acon.logindata!.data![0].userId);
                                acon.storage.write("username", acon.logindata!.data![0].userName);
                                Get.off(() => Bottomsheet());
                              }
                              else
                                Fluttertoast.showToast(msg: "Wrong otp");
                              acon.otpCon.clear();
                              //  var DoctorID = GetStorage().read('driverId').toString();           
                              //  print('aaaaa'+DoctorID);       ;
                               }
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/2,
                              decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                              
                            ),
                          ),
                        ),
                                    ]),
        ),));
  }
}