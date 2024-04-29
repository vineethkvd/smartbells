import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartbells/view/auth/view_auth/mobile_number.dart';
import 'package:smartbells/view/profile/view_profile/language.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../profile/view_profile/Edit Profile/editprofile.dart';
import '../../profile/view_profile/aboutus.dart';
import '../../profile/view_profile/privacy.dart';
import '../../profile/view_profile/support.dart';
import '../../profile/view_profile/terms.dart';


class myAccount extends StatefulWidget {
  const myAccount({super.key});

  @override
  State<myAccount> createState() => _myAccountState();
}

class _myAccountState extends State<myAccount> {
    @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: 
    Scaffold(
      backgroundColor: greyColor,
      body: Column(children: [
          Row(
          children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
              //   child:   IconButton(
              // icon: Icon(
              //   Icons.arrow_back,
              //   color: blackColor,
              // ),
              // onPressed: () => Get.back(),
              //     ),
              ),
                    const Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Txt(text: 'Settings' ,fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
        Container(
          height: mHeight/9,
          width: mWidth,
          color: whiteColor,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/profile.png',scale: 3.5,),
            ),
            SizedBox(
              //color: Colors.amber,
              width: mWidth/1.52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Txt(text: GetStorage().read("username")==null?"Guest":GetStorage().read("username"),fsize: 20,),
                Txt(text: 'View Profile',fsize: 13,),
              ],),
            ),
            IconButton(onPressed: (){
              Get.to(() => const name());
            }, icon: const Icon(Icons.arrow_forward_ios))

          ]),),
          const SizedBox(height: 30,),
          Container(
            // height: mHeight/2.9,
          width: mWidth,
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/aboutus.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'About Us',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                       Get.to(() => const AboutUs());
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  )]),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            //                     child: Row(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Image.asset(
            //                             'assets/images/support.png',
            //                             height: 25,
            //                           ),
            //                         ),
            //                         const Padding(
            //                           padding: EdgeInsets.all(8.0),
            //                           child: Txt(
            //                             text: 'Support',
            //                             fsize: 14,
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                    InkWell(
            //         onTap: (){
            //            Get.to(() => const Support());
            //         },
            //         child: Row(
            //           children: const [
            //             Padding(
            //               padding: EdgeInsets.all(8.0),
            //               child: Icon(
            //                 Icons.arrow_forward_ios,
            //                 size: 15,
            //               ),
            //             )
            //           ],
            //         ),
            //       )]),
            //   SizedBox(
            //   height: mHeight / 300,
            //   child: const Divider(
            //     thickness: 1,
            //     color: bgreyColor,
            //   ),
            // ),
                          InkWell(
              onTap: () {
                Get.to(() => const Privacy());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/privacy.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Privacy Policy',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                          InkWell(
              onTap: () {
                Get.to(() => const Terms());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/terms.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Terms & Conditions',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                       InkWell(
              onTap: () {
                Get.to(() => const Language());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/language.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Language',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                          InkWell(
              onTap: () {
                 showDialog(
                  context: context,
                  builder: (context) =>
                      StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: Container(
                            // width: 130,
                            decoration: const BoxDecoration(
                                // border: Border(
                                //   bottom: BorderSide(
                                //     //                    <--- top side
                                //     color: greenn,
                                //     width: 1.2,
                                //   ),
                                // ),
                                ),
                            child: Column(
                              children:  [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Are you sure,".tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "you want to logout ?".tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                           
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appColor,
                                  ),
                                  child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                     backgroundColor: appColor, foregroundColor: whiteColor),
                                    //color: Color.fromARGB(255, 2, 228, 119),
                                    child: const Txt(
                                      text: 'Cancel',
                                      color: whiteColor,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appColor,
                                  ),
                                  child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: appColor, foregroundColor: whiteColor),
                                    child: const Txt(
                                      text: 'Logout',
                                      color: whiteColor,
                                    ),
                                    onPressed: () async {
                                      GetStorage().remove('userId');
                                      Get.offAll(()=>const mobileNumber());
                                  
                                      // SharedPreferences pref =
                                      //     await SharedPreferences.getInstance();
                                      // pref.clear();
                                      // Navigator.of(context)
                                      //     .pushAndRemoveUntil(
                                      //         MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 Login()),
                                      //         (Route<dynamic> route) =>
                                      //             false);
                                    },
                                  ),
                                  
                                ),
                               
                              ],
                            ),
                             const SizedBox(height: 20,)
                          ],
                        );
                      })
                      );
                //Get.to(() => contactUs());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/logout.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Logout',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
            
            ]
                ),
          ))]),));
  }
}