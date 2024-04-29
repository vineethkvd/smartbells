

import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:smartbells/api_endpoints.dart';
import 'package:smartbells/common/text.dart';
import 'package:smartbells/view/auth/view_auth/otp.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/notification.dart';
import 'package:smartbells/view/homepage/controller/home_controller.dart';
import 'package:smartbells/view/homepage/view_home/daily_weekly.dart';
import 'package:smartbells/view/homepage/view_home/hourly.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/base_colors.dart';
import '../../../controller/init.dart';
import '../../alarmscreen/hourlyalarm.dart';
import '../../homepage/model/alarmmodel.dart';
import '../../homepage/model/listalarm.dart';
import '../../homepage/view_home/daily_schedule.dart';
import '../../homepage/view_home/weekly_schedule.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'bottomsheet.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  HomeCon hcon = Get.put(HomeCon());
  InitCon init = Get.put(InitCon());
  DateTime today = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TabController? _tabController;
  var currentindex = 0;
  var selectedTabIndex = 0;

  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await hcon.bannerFunc();
    await hcon.audioFunc();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
        child: Scaffold(
      persistentFooterButtons: [
        selectedTabIndex == 1
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(weeklySchedule());
                    },
                    child: Container(
                      height: mHeight / 17,
                      width: mWidth / 2.4,
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Txt(
                        text: 'Set Alarm'.tr,
                        fsize: 15,
                        weight: FontWeight.w500,
                        color: whiteColor,
                      )),
                    ),
                  ),
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      // GetStorage().remove("alarmlist");
                      int random=Random().nextInt(hcon.audiodata!.data.audio.length-1);






                      if(GetStorage().read('alarmid')==null){
                        GetStorage().write('alarmid',1);
                      }else{
                        int id=GetStorage().read('alarmid');
                        print(id.toString());
                        GetStorage().write('alarmid',++id,);
                        print(GetStorage().read('alarmid').toString()+'kfmwkoemif');
                      }
                      try{

                        init.alarm=listalarmFromJson(GetStorage().read("alarmlist"));

                      }catch(E){
                        init.alarm=[];


                      }
                      for(int i=0;i<init.Alarmadd1.length;i++){
                        for(int j=0;j<init.Alarmadd1[i].hours.length;j++){

                          if(init.Alarmadd1[i].hours.length!=0){
                            print(init.Alarmadd1[i].hours[j]);
                            print(init.Alarmadd1[i].days);
                            print("kjfioji");
                            List days=[init.Alarmadd1[i].days];
                            // AwesomeNotifications().createNotification(
                            //     content: NotificationContent(
                            //       id:GetStorage().read('alarmid'),
                            //
                            //       channelKey: 'alarm_channel',
                            //       title: 'Alarm',
                            //       body: init.Alarmadd1[i].hours[j]==24? 0.toString():init.Alarmadd1[i].hours[j].toString()+":00",
                            //       locked: true,
                            //
                            //
                            //       // bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
                            //       // notificationLayout: NotificationLayout.BigPicture,
                            //       displayOnBackground: true,
                            //       displayOnForeground: true,
                            //       customSound: "assets/Alarm Morning.mp3",
                            //
                            //
                            //
                            //
                            //
                            //
                            //       fullScreenIntent: false,),
                            //     actionButtons: [
                            //       NotificationActionButton(key: 'snooze', label: 'SNOOZE'),
                            //       NotificationActionButton(
                            //           key: 'STOP',
                            //           label: 'STOP',
                            //           // buttonType: ActionButtonType.DisabledAction,
                            //
                            //           isDangerousOption: true)
                            //     ],
                            //     schedule:NotificationCalendar(
                            //         allowWhileIdle: true,
                            //         preciseAlarm: true,
                            //         repeats: true,
                            //         hour: init.Alarmadd1[i].hours[j]==24?0:init.Alarmadd1[i].hours[j],
                            //         weekday: init.Alarmadd1[i].days,
                            //         minute: 0,
                            //         second: 0
                            //     )
                            //   //
                            //
                            //
                            //
                            //
                            // );
                            try{
                              Dio().download(
                                  API().baseImage+hcon.audiodata!.data.audio[random].audio,
                                  "/storage/emulated/0/Download/" + hcon.audiodata!.data.audio[random].audName+".mp3");
                             await GetStorage().write('linktune1',"/storage/emulated/0/Download/" + hcon.audiodata!.data.audio[random].audName+".mp3");
                              print(GetStorage().read('linktune1'));

                            }catch(E){
                              await GetStorage().write('linktune1',"/storage/emulated/0/Download/" + hcon.audiodata!.data.audio[random].audName+".mp3");
                              print(GetStorage().read('linktune1'));
                            }
                            final alarmSettings = AlarmSettings(

                                id: GetStorage().read('alarmid'),
                                dateTime: DateFormat("yyyy-MM-dd HH:mm").parse(
                                    "${DateFormat("yyyy-MM-dd").format(DateTime.now()).toString()} ${init.Alarmadd1[i].hours[j]==24?0:init.Alarmadd1[i].hours[j]}:${"${00}"}"),
                                assetAudioPath: GetStorage().read('linktune1'),
                                notificationTitle:
                                 'Alarm',

                                enableNotificationOnKill: true,
                                vibrate: false,

                                notificationBody: init.Alarmadd1[i].hours[j]==24? 0.toString():init.Alarmadd1[i].hours[j].toString()+":00", weekdays: days, loop: true);

                            Alarm.set(alarmSettings: alarmSettings);

                          }
                        }


                      }



                      init.alarm.add(Listalarm(id: GetStorage().read('alarmid'), name:  hcon.cnt.dropDownValue?.name??"", tunepath: '', content: '', alarm: init.Alarmadd1));

                      GetStorage().write("alarmlist", listalarmToJson(init.alarm));
                      _showAlertDialog();

                    },
                    child: Container(
                      height: mHeight / 18,
                      width: mWidth / 3,
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Txt(
                        text: 'Set Alarm'.tr,
                        fsize: 16,
                        weight: FontWeight.bold,
                        color: whiteColor,
                      )),
                    ),
                  ),
                ),
              )
      ],
      backgroundColor: greyColor,
      body: DefaultTabController(
        length: 2,
        initialIndex: currentindex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(height: 200.0,

                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 4),
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
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       hcon.bannerdata?.data.banner[0].adImage == null
                //           ? Image.asset(
                //               'assets/images/banner.png',
                //               scale: 4,
                //             )
                //           : Image.network(
                //               API().baseURL +
                //                   hcon.bannerdata!.data.banner[0].adImage
                //                       .toString(),
                //               scale: 3,
                //             ),
                //     ],
                //   ),
                // ),
                Container(
                  width: mWidth / 1.1,
                  // height: mHeight,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Txt(
                              text: 'Set Alarm'.tr,
                              fsize: 17,
                              weight: FontWeight.w500,
                              color: appColor,
                            ),
                            selectedTabIndex == 0
                                ? SizedBox(
                                    height: 45,
                                  )
                                : IconButton(
                                    onPressed: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                        Get.to(dailySchedule());
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: appColor,
                                    ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: appColor, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: greyColor,
                                  borderRadius: BorderRadius.circular(20)),
                              // width: mWidth / 2,
                              // height: mHeight / 27,
                              child: TabBar(
                                //dividerColor: blackColor,
                                controller: _tabController,
                                isScrollable: true,
                                indicatorColor: whiteColor,
                                // overlayColor: ,
                                onTap: (v) {
                                  selectedTabIndex = v;
                                  setState(() {});
                                },
                                tabs: [
                                  Tab(
                                    child: Container(
                                      // width: mWidth / 5.8,
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Hourly".tr,
                                              // fsize: 14,
                                              //color: RedColor,
                                            )
                                          ]),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      // color: Colors.amber,
                                      // width: mWidth / 5.8,
                                      //height: mHeight / 27,
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Daily/Weekly".tr,
                                              //color: RedColor,
                                              //fsize: 14,
                                            )
                                          ]),
                                    ),
                                  ),
                                ],
                                labelColor: whiteColor,
                                unselectedLabelColor: appColor,

                                indicator: BoxDecoration(
                                    color: appColor,
                                    border: Border.all(color: appColor),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: mHeight * 0.5,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      hourly(),
                      DailyWeekly(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      hcon.bannerdata?.data.banner[1].adImage == null
                          ? Image.asset(
                              'assets/images/banner.png',
                              scale: 4,
                            )
                          : Image.network(
                              API().baseURL +
                                  hcon.bannerdata!.data.banner[1].adImage
                                      .toString(),
                              scale: 3.8,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
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
              child: Center(child: Text('Alarm set  successfully'.tr))),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.offAll(Bottomsheet());
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
                      text: 'ok'.tr,
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

