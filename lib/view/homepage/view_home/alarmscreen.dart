import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api_endpoints.dart';
import '../../../common/base_colors.dart';
import '../../bottomsheet/view_bottom/home.dart';
import '../controller/home_controller.dart';

class alarmsscreen extends StatefulWidget {
  final AlarmSettings alarmSettings;
  const alarmsscreen({Key? key, required this.alarmSettings}) : super(key: key);

  @override
  State<alarmsscreen> createState() => _alarmsscreenState();
}

class _alarmsscreenState extends State<alarmsscreen> {

  HomeCon hcon = Get.put(HomeCon());
  getrecord()async{
    await hcon. bannerFunc();
    setState(() {

    });
  }
  @override
  void initState() {
    GetStorage().remove('alarmnotifi');
  getrecord();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: (){
                      Alarm.stop(widget.alarmSettings.id)
                          .then((_) =>  exit(0));

                    },

                    child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.cancel_outlined,color: Colors.white,size:40 ,),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appColor,
                      ),

                    ),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: hcon.bannerdata?.data.banner[1].adImage == null
                  ? Image.asset(
                      'assets/images/banner.png',
                      scale: 4,
                    )
                  :  CarouselSlider(
                options: CarouselOptions(height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                  viewportFraction: 1,

            ),
        items:hcon.bannerdata?.data.banner .map((i) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: ()async{
              var _url = Uri.parse(i.adUrl);

              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }

                },
                child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(
                //     color: Colors.amber
                // ),
                child: Image.network( API().baseURL +i.adImage,fit: BoxFit.cover,)
                ),
              );
            },
          );
        }).toList(),
      ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final now = DateTime.now();
                    Alarm.set(
                      alarmSettings: widget.alarmSettings.copyWith(

                        dateTime: DateTime(
                          now.year,
                          now.month,
                          now.day,
                          now.hour,
                          now.minute,
                          0,
                          0,
                        ).add(const Duration(minutes: 5)),
                      ),
                    ).then((_) => exit(0));
                    exit(0);
                  },
                  child: Text(
                    "Snooze".tr,
                    style:TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: mHeight / 6,
                 width: mWidth / 2,
                  // child: AnalogClock(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 2.0, color: appColor),
                  //
                  //       color: appColor,
                  //       shape: BoxShape.circle),
                  //   width: 200.0,
                  //   isLive: true,
                  //   hourHandColor: whiteColor,
                  //   minuteHandColor: whiteColor,
                  //   showSecondHand: true,
                  //   numberColor: whiteColor,
                  //   showNumbers: true,
                  //   showAllNumbers: true,
                  //   textScaleFactor: 1.4,
                  //   showTicks: false,
                  //   showDigitalClock: false,
                  //   datetime: DateTime.now(),
                  // ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Alarm.stop(widget.alarmSettings.id)
                        .then((_) =>  exit(0));
                  },
                  child: Text(
                    "Stop".tr,
                   style: TextStyle(
                     color: Colors.white
                   ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "You alarm  is ringing...".tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height:20,
            ),
            // const Text("🔔", style: TextStyle(fontSize: 50)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     RawMaterialButton(
            //       onPressed: () {
            //         final now = DateTime.now();
            //         Alarm.set(
            //           alarmSettings: widget.alarmSettings.copyWith(
            //             dateTime: DateTime(
            //               now.year,
            //               now.month,
            //               now.day,
            //               now.hour,
            //               now.minute,
            //               0,
            //               0,
            //             ).add(const Duration(minutes: 1)),
            //           ),
            //         ).then((_) => Navigator.pop(context));
            //       },
            //       child: Text(
            //         "Snooze",
            //         style: Theme.of(context).textTheme.titleLarge,
            //       ),
            //     ),
            //     RawMaterialButton(
            //       onPressed: () {
            //         Alarm.stop(widget.alarmSettings.id)
            //             .then((_) => Navigator.pop(context));
            //       },
            //       child: Text(
            //         "Stop",
            //         style: Theme.of(context).textTheme.titleLarge,
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hcon.bannerdata?.data.banner[1].adImage == null
                        ? Container(
                      width:mWidth,

                          child: Image.asset(
                              'assets/images/banner.png',
                            fit: BoxFit.cover,

                            ),
                        )
                        : Image.network(
                            API().baseURL +
                                hcon.bannerdata!.data.banner[1].adImage
                                    .toString(),
                            scale: 2.7,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
