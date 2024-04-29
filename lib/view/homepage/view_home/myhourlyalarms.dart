import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/init.dart';
import '../../bottomsheet/view_bottom/myalarmclock.dart';
import '../model/listalarm.dart';

class myhouralarm extends StatefulWidget {
  const myhouralarm({Key? key}) : super(key: key);

  @override
  State<myhouralarm> createState() => _myhouralarmState();
}

class _myhouralarmState extends State<myhouralarm> {
  InitCon init = Get.put(InitCon());
  @override
  void initState() {
    print(GetStorage().read("alarmlist"));
    try {
      init.myalarm = listalarmFromJson(GetStorage().read("alarmlist"));
    } catch (E) {
      init.myalarm = [];
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        // leading: IconButton(
        //     onPressed: (){
        //       Get.back();
        //     },
        //     icon: Icon(Icons.arrow_back_rounded,
        //       size: 40,
        //       color: blackColor,)),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.5,
                scale: 6,
                image: AssetImage('assets/images/clock-01.png',)
            )

        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8,),
            //         child:   IconButton(
            //           icon: Icon(
            //             Icons.arrow_back,
            //             color: blackColor,
            //           ),
            //           onPressed: () => Get.back(),
            //         ),
            //       ),
            //       Txt(text: 'my hourly alarms',fsize: 18,weight: FontWeight.w500,),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 8),
            //         child: IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,size: 30,)),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: mHeight / 1.1,
              // width: mWidth / 1.1,
              child: init.myalarm.isNotEmpty?ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: init.myalarm.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(index.toString()),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade600,
                                  spreadRadius: 0.5,
                                  blurRadius: 5)
                            ],
                            borderRadius: BorderRadius.circular(15)),

                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(Icons.delete, color: Colors.white),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text('Move to trash',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      background: Container(),
                      onDismissed: (DismissDirection direction) async{
                        await AwesomeNotifications().cancelSchedule(init.myalarm[index].id);


                        setState(() {
                          init.myalarm.removeAt(index);

                        });
                        GetStorage().write("alarmlist",listalarmToJson(init.myalarm));
                      },
                      child: InkWell(
                        onTap: () {
                          init.myalarmindex = index;
                          Get.to(alarmhourdetail());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: mHeight / 8,
                            width: mWidth / 1,
                            // alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade600,
                                      spreadRadius: 0.5,
                                      blurRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Txt(
                                  text: 'Reminder',
                                  fsize: 18,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Txt(
                                  text: init.myalarm[index].name,
                                  weight: FontWeight.w500,
                                  fsize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }):Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0,
                      right: 0,
                      top: 350
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Txt(
                        text: 'No Alarms Set'.tr,
                        fsize: 25,
                        weight: FontWeight.w600,
                        color: appColor,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
