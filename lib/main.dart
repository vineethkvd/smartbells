import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui';

import 'package:alarm/alarm.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smartbells/translation.dart';
import 'package:smartbells/view/auth/view_auth/welcome_1.dart';
import 'package:smartbells/view/homepage/view_home/alarmscreen.dart';
import 'package:workmanager/workmanager.dart';

import 'common/base_colors.dart';
import 'controller/languagecontroller.dart';
import 'view/auth/controller/auth_controller.dart';
import 'view/bottomsheet/view_bottom/bottomsheet.dart';

const simpleTaskKey = "simpleTask";
const rescheduledTaskKey = "rescheduledTask";
const failedTaskKey = "failedTask";
const simpleDelayedTask = "simpleDelayedTask";
const simplePeriodicTask = "simplePeriodicTask";
const simplePeriodic1HourTask = "simplePeriodic1HourTask";



 SendPort? uiSendPort;
const String isolateName = 'isolate';
var payloadnoti;

void main() async {


  Get.put(AuthCon());

  AwesomeNotifications().createdStream.listen((notification) {
    Fluttertoast.showToast(msg: notification.id.toString());
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Notification Created on ${}'),
    //   ),
    // );
  });
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().actionStream.listen((event)async {
    payloadnoti=event.id;

    print('initiated');
    if(event.id !=null )
    GetStorage().write('alarmnotifi', event.id);


    print(event.buttonKeyPressed);
    if(event.buttonKeyPressed=="STOP"){
      Alarm.stop(event.id??0);


    }


    // Get.to(alarmsscreen(alarmSettings: event,))
    payloadnoti=event?.payload;
    print(event?.payload);
    await Future.delayed(Duration(seconds: 7));
    GetStorage().remove('alarmnotifi');
  });
  AwesomeNotifications().displayedStream.listen((event)async {
    // uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    // uiSendPort?.send(null);
    if(event.id !=null )
      GetStorage().write('alarmnotifi', event.id);
    // FlutterRingtonePlayer.playAlarm();
    // // Uint8List imgbytes= await File('/storage/emulated/0/Download/Jack Sparrow Bgm.mp3').readAsBytes();
    // // await AudioPlayer().play(BytesSource(imgbytes));
    // await Future.delayed(const Duration(seconds: 30));
    // // AudioPlayer().stop();
    // FlutterRingtonePlayer.stop();
    print('hi iam');
  });
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();


  // AwesomeNotifications().setChannel(
  //     onActionReceivedMethod: NotificationsController.onActionReceivedMethod,
  //     onNotificationCreatedMethod:
  //     NotificationsController.onNotificationCreatedMethod,
  //     onNotificationDisplayedMethod:
  //     NotificationsController.onNotificationDisplayedMethod,
  //     onDismissActionReceivedMethod:
  //     NotificationsController.onDismissActionReceivedMethod);
  // AwesomeNotifications().setChannel(
  //     onNotificationDisplayedMethod:
  //       NotificationsController.onNotificationDisplayedMethod,
  // );


  Alarm.ringStream.stream.listen((alarmSettings) => Get.to(alarmsscreen(alarmSettings: alarmSettings,)));
  // await FileManager.requestFilesAccessPermission();
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  await Alarm.init(showDebugLogs: true);
  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: true,
          importance: NotificationImportance.Max,
          channelShowBadge: true,

          soundSource: "File: '/storage/emulated/0/Download/Jack Sparrow Bgm.mp3",
            locked: true


        ),
        NotificationChannel(
            channelGroupKey: 'category_tests',
            channelKey: 'alarm_channel1',
            channelName: 'Alarms Channel',
            channelDescription: 'Channel with alarm ringtone',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.Max,

            soundSource:"File://storage/emulated/0/Download/Jack Sparrow Bgm.mp3",


            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            locked: true,
            enableLights: true,
            enableVibration: true,
            // vibrationPattern:Int64List.fromList([0, 200, 200, 200]),



            defaultRingtoneType: DefaultRingtoneType.Alarm
        ),
      ]
  );
  // AndroidForegroundService.startForeground(
  //
  //
  //     content: NotificationContent(
  //         id: 2341234,
  //         body: 'Service is running!',
  //         title: 'Android Foreground Service',
  //         channelKey: 'basic_channel',
  //         bigPicture: 'asset://assets/images/android-bg-worker.jpg',
  //         notificationLayout: NotificationLayout.BigPicture,
  //         category: NotificationCategory.Service
  //     ),
  //     actionButtons: [
  //       NotificationActionButton(
  //           key: 'SHOW_SERVICE_DETAILS',
  //           label: 'Show details'
  //       )
  //     ]
  // );

  // AwesomeNotifications().actionStream.listen((receivedNotifiction)
  // {
  //  print(12345);
  // });
  await Permission.storage.request();
  await Permission.manageExternalStorage.request();
  await Permission.notification;
  await Permission.accessNotificationPolicy;
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<AlarmSettings> alarms;
  // static StreamSubscription? subscription;


  void loadAlarms() {

      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);

  }
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Allow Notifications'),
              content: Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
    super.initState();
    loadAlarms();
    // subscription ??= Alarm.ringStream.stream.listen(
    //       (alarmSettings) => Get.to(alarmsscreen(alarmSettings: alarmSettings,)),
    // );
  }
  final MyController con = Get.put(MyController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    return GetMaterialApp(
      translations: ChangeLanguage(),
      locale: Locale('en', 'US'),
      title: 'Smart Bells',
      theme: ThemeData(
        fontFamily: "Poppins",
        backgroundColor: whiteColor,
        scaffoldBackgroundColor: whiteColor,
         primaryColor: appColor,
         primarySwatch: colorCustom,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
       home:GetStorage().read('alarmnotifi')!=null? alarmsscreen(alarmSettings: AlarmSettings(id:GetStorage().read('alarmid'), dateTime: DateTime.now(), assetAudioPath: '', weekdays: [], loop: false)):AnimatedSplashScreen(
              duration: 2500,
              splash: Image.asset(
                "assets/images/Smart-Bells.png",
                width: 230,
                height: 170,
                fit: BoxFit.cover,
              ),
              splashIconSize: 350,
              nextScreen:  UserID != null ?  Bottomsheet():welcome1() ,
              //nextScreen: Bottomsheet(),
              splashTransition: SplashTransition.scaleTransition,

              backgroundColor: whiteColor),
      // home: driverID == 'null' ? SplashView() : ChoosePickup(),
      //home: ,
    );
  }
}


