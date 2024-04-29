import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbells/common/text.dart';

import '../../../common/base_colors.dart';
import '../../../controller/languagecontroller.dart';
import '../../auth/controller/auth_controller.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final MyController con = Get.put(MyController());
  
  @override
  Widget build(BuildContext context) {
    AuthCon acon = Get.put(AuthCon());
    return SafeArea(
      child: Scaffold(
        backgroundColor: greyColor,
         appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                       icon: Icon(Icons.arrow_back_rounded,
                       size: 40,
                       color: blackColor,)),
                       centerTitle: true,
                       title: Txt(text: "Language".tr,fsize: 20,weight: FontWeight.w500,),
                       ),
                       body: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Txt(
                                  text: "Select Your Language".tr,
                                  fsize: 17,
                                  weight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: mWidth/1.1,
                            decoration: BoxDecoration(color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                             boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7.0,
                    spreadRadius: 0.1,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
               ),
                            child: Column(
                              children: [
                                
                                ListTile(
                                  title: Txt(text: "English"),
                                  horizontalTitleGap: -10,
                                  leading: Radio(
                                    value: 0,
                                    groupValue: acon.val,
                                    onChanged: (value) {

                                        Get.updateLocale(Locale('en', 'US'));
                                        con.setlancode('en');
                                        con.setlancountry('US');

                                      setState(() {
                                        acon.val = value!;
                                      });
                                    },
                                    activeColor: appColor,
                                  ),
                                ),
                                SizedBox(
                                                  height: mHeight / 57,
                                                  width: mWidth / 1.14,
                                                  child: Divider(thickness: 1, color: greyColor),
                                                ),
                                 ListTile(
                                   title: Txt(text: "Telugu"),
                                   horizontalTitleGap: -10,
                                   leading: Radio(
                                     value: 1,
                                     groupValue: acon.val,
                                     onChanged: (value) {


                                         Get.updateLocale(Locale('vi', 'VN'));
                                         con.setlancode('vi');
                                         con.setlancountry('VN');

                                       setState(() {
                                         acon.val = value!;
                                       });
                                     },
                                     activeColor: appColor,
                                   ),
                                 ),
                                          
                              ],
                            ),
                          ),
                         ]),
                       ),
      ),
    );
  }
}