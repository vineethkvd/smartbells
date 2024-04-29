import 'dart:collection';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:smartbells/common/text.dart';
import 'package:smartbells/view/homepage/view_home/weekly_schedule.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common/base_colors.dart';
import '../controller/home_controller.dart';
import '../model/utilscal.dart';
import 'daily_schedule.dart';

class DailyWeekly extends StatefulWidget {
  const DailyWeekly({super.key});

  @override
  State<DailyWeekly> createState() => _DailyWeeklyState();
}

class _DailyWeeklyState extends State<DailyWeekly> {
  HomeCon homecon = Get.put(HomeCon());
  DateTime today = DateTime.now();


  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  DateTime _focusedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    await homecon.onDaySelected(selectedDay, focusedDay);

    setState(() {});
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // physics: NeverScrollableScrollPhysics(),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mWidth / 1.1,
                height: mHeight,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
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
                                  text: 'Today Alarm'.tr,
                                  fsize: 17,
                                  weight: FontWeight.w700,
                                  color: appColor,
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          final TimeOfDay? timeOfDay = await showTimePicker(
                              context: context,
                              initialTime: homecon.selectedTime1,
                              initialEntryMode: TimePickerEntryMode.dial);
                          if (timeOfDay != null) {
                            setState(() {
                              homecon.selectedTime1 = timeOfDay;
                            });
                           Get.to(dailySchedule());
                            //   AwesomeNotifications().createNotification(
                            //     content: NotificationContent(
                            //         id: 2,
                            //
                            //         channelKey: 'key1',
                            //         title: 'This is Notification title',
                            //         body: "${(DateTime.now().add(Duration(minutes: 1))).toString()}",
                            //         // bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
                            //         // notificationLayout: NotificationLayout.BigPicture,
                            //       displayOnBackground: true,
                            //       displayOnForeground: true,
                            //       customSound: "File: '/storage/emulated/0/Download/Jack Sparrow Bgm.mp3",
                            //       fullScreenIntent: true
                            //
                            //
                            //
                            //
                            //     ),
                            //     actionButtons: [
                            //       NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
                            //       NotificationActionButton(
                            //           key: 'DISMISS',
                            //           label: 'Dismiss',
                            //           buttonType: ActionButtonType.DisabledAction,
                            //
                            //           isDangerousOption: true)
                            //     ],
                            //
                            //     // schedule:NotificationCalendar.fromDate(date: (DateTime.now().add(Duration(minutes: 1))))
                            // );
                            //   AndroidForegroundService.startForeground(
                            //       foregroundServiceType:1,
                            //
                            //
                            //       content: NotificationContent(
                            //           id: 2341234,
                            //           body: 'Service is running!',
                            //           title: 'Android Foreground Service',
                            //           channelKey: 'key2',
                            //           // bigPicture: 'asset://assets/images/android-bg-worker.jpg',
                            //           // notificationLayout: NotificationLayout.BigPicture,
                            //           category: NotificationCategory.Service
                            //       ),
                            //       actionButtons: [
                            //         NotificationActionButton(
                            //             key: 'SHOW_SERVICE_DETAILS',
                            //             label: 'Show details'
                            //         )
                            //       ]
                            //   );
                            //
                            //   // Get.to(dailySchedule());
                          }
                        },
                        child: SizedBox(
                          height: mHeight / 3.4,
                          width: mWidth / 1.9,
                          child: AnalogClock(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2.0, color: appColor),
                                color: appColor,
                                shape: BoxShape.circle),
                            width: 150.0,
                            isLive: true,
                            hourHandColor: whiteColor,
                            minuteHandColor: whiteColor,
                            showSecondHand: true,
                            numberColor: whiteColor,
                            showNumbers: true,
                            showAllNumbers: true,
                            textScaleFactor: 1.4,
                            showTicks: false,
                            showDigitalClock: false,
                            datetime: DateTime.now(),
                          ),
                        ),
                      ),
                    ),
                    Txt(text: "${DateTime.now().hour} : ${DateTime.now().minute}"),
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
                                  text: 'Date wise Alarm'.tr,
                                  fsize: 17,

                                  weight: FontWeight.w700,
                                  color: appColor,
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCalendar(
                        pageJumpingEnabled: true,
                        pageAnimationEnabled: true,

                        firstDay: kFirstDay,
                        lastDay: kLastDay,
                        focusedDay: homecon.focusedDay1,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),

                        //calendarFormat: _calendarFormat,
                        //eventLoader: _getEventsForDay,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        selectedDayPredicate: (day) {
                          // Use values from Set to mark multiple days as selected
                          return homecon.selectedDays.contains(day);
                        },
                        onDaySelected: _onDaySelected,
                        // onFormatChanged: (format) {
                        //   if (_calendarFormat != format) {
                        //     setState(() {
                        //       _calendarFormat = format;
                        //     });
                        //   }
                        // },
                        onPageChanged: (focusedDay) {
                          homecon.focusedDay1 = focusedDay;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: Text('Clear selection'.tr),
                          onPressed: () {
                            setState(() {
                              homecon.selectedDays.clear();
                              homecon.selecteddays1.clear();
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )

                    //         Padding(
                    //    padding: const EdgeInsets.all(20.0),
                    //    child: InkWell(
                    //     onTap: (){
                    //      Get.to(weeklySchedule());
                    //     },
                    //      child: Container(
                    //                       height: mHeight/17,
                    //                       width: mWidth/2.4,
                    //                       decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(12)),
                    //                       child: Center(child: Txt(text: 'Set Alarm',fsize: 15,weight: FontWeight.w500,color: whiteColor,)),

                    //                     ),
                    //    ),
                    //  ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
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
              child: Center(child: Text('Complaint sent successfully'))),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.to(weeklySchedule());
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
                      text: 'ok',
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
