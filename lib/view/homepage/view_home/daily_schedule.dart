import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:smartbells/common/base_colors.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/bottomsheet.dart';
import 'package:smartbells/view/homepage/view_home/tune.dart';

import '../../../common/text.dart';
import '../../../controller/init.dart';
import '../../auth/controller/auth_controller.dart';
import '../../bottomsheet/view_bottom/home.dart';
import '../controller/home_controller.dart';
import '../model/listalarm.dart';
import 'myhourlyalarms.dart';

class dailySchedule extends StatefulWidget {
  const dailySchedule({super.key});

  @override
  State<dailySchedule> createState() => _dailyScheduleState();
}

class _dailyScheduleState extends State<dailySchedule> {
  HomeCon hcon = Get.put(HomeCon());
  AuthCon acon = Get.put(AuthCon());
  InitCon init = Get.put(InitCon());
  List<int> selectedweekdays=[];
  var dayList = [
    {
      "title": "Mo".tr,
      "id":1,
      "status":false
    },
    {"title": "Tu".tr,
      "id":2,
      "status":false
    },
    {"title": "We".tr,
      "id":3,
      "status":false
    },
    {"title": "Th".tr,
      "id":4,
      "status":false
    },
    {"title": "Fr".tr,
      "id":5,
      "status":false
    },
    {"title": "Sa".tr,
      "id":6,
      "status":false
    },
    {"title": "Su".tr,
      "id":7,
      "status":false
    },
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  late SingleValueDropDownController _cnt1;
  late SingleValueDropDownController _cnt2;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    call();

    _cnt1 = SingleValueDropDownController();
    _cnt2 = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    hcon.cnt.dispose();
    _cnt1.dispose();
    _cnt2.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  call()async{
    await hcon.eventFunc();
    await hcon.audioFunc();
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
      backgroundColor: greyColor,
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: Container(
            //       width: 350,
            //       decoration: BoxDecoration(
            //           color: whiteColor,
            //           borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: TextFormField(
            //
            //           controller: acon.alarmtype,
            //           decoration: InputDecoration(
            //               border: InputBorder.none,
            //               // border: OutlineInputBorder(),
            //               prefix: Txt(text:'  '),
            //               // filled: true,
            //               // fillColor: greyColor,
            //               hintText: 'Drinking water',
            //               labelText: "Remind for",
            //               hintStyle: TextStyle(color: darkGreyColor,fontWeight: FontWeight.w500,fontSize: 16)
            //           ),
            //           autofocus: false,
            //         ),)),
            // ),
            
             SizedBox(height: 15,),
             Center(
               child: Container(
                                        width: 350,
                                        decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                      
                     textFieldDecoration: InputDecoration(
                       border: InputBorder.none,
                                    hintText: 'Select Event'.tr,
                                    hintStyle: TextStyle(color: darkGreyColor,fontSize: 16,fontWeight: FontWeight.w500)
                     ),
                      // initialValue: "name4",
                      // readOnly: false,
                      controller: hcon.cnt,
                      clearOption: true,
                                   
                      keyboardType: TextInputType.none,
                      //autovalidateMode: AutovalidateMode.always,
                      clearIconProperty: IconProperty(color: Colors.green,size: 20),
                      searchDecoration: const InputDecoration(
                         // hintText: "enter your custom hint text here"
                          ),
                     //  validator: (value) {
                     //    if (value == null || value.isEmpty) {
                     //      return "Required field";
                     //    } else {
                     //      return null;
                     //    }
                     //  },
                      dropDownItemCount: 6,

                      dropDownList: hcon.eventList,
                      dropdownColor: whiteColor,
                      dropDownIconProperty: IconProperty(color: appColor,size: 30),
                      textStyle: TextStyle(fontSize: 13,color: appColor),
                      
                      //dropDownList: init.searchD,
                      onChanged: (val)async {
                       hcon.eventList.clear();
                        //await init.getPlaces(_cnt.dropDownValue?.value ?? '');
                        //set();
                        //init.searchD.clear();
                       
                      }, 
                    ),)),
             ),
             SizedBox(height: 15,),
             Center(
               child: InkWell(
                onTap: () {
                  Get.to(Audio(audio: '',));
                },
                 child: Container(
                                          width: 350,
                                          height: 100,
                                          decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(child: Txt(text: GetStorage().read("linkname")==null?'Select Tune':GetStorage().read("linkname"),color: darkGreyColor,fsize: 16,weight: FontWeight.w500),width: 220,),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.arrow_drop_down,color: appColor,size: 30,),
                              )
                            ],
                          ),)),
               ),
             ),
             SizedBox(height: 15,),
            Center(
              child: Container(
                  width: 350,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,


                          itemCount: 7,
                            scrollDirection: Axis.horizontal,

                            itemBuilder: (context,index){
                          return Padding(

                            padding: const EdgeInsets.only(left: 5),
                            child: InkWell(
                              onTap: (){
                                dayList[index]['status']=!(dayList[index]['status'].toString()=='true'?true:false);
                                print(int.parse(dayList[index]['id'].toString()));

                                if(dayList[index]['status'].toString()=='true'){

                                  selectedweekdays.add( int.parse(dayList[index]['id'].toString()));

                                }else{
                                  selectedweekdays.remove( int.parse(dayList[index]['id'].toString()));
                                }
                                print(selectedweekdays);

                                setState(() {

                                });

                              },
                              child: Container(


                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor:  dayList[index]['status'].toString()=="true"?appColor:Colors.grey,
                                      child: Text(
                                        dayList[index]['title'].toString(),style: TextStyle(
                                        color: dayList[index]['status'].toString()=='true'?Colors.white:Colors.black45
                                      )
                                      ),


                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Icon(Icons.arrow_drop_down,color: appColor,size: 30,),
                        // )


                      ],

                    ),)),
            ),
            SizedBox(height: 15,),
             // Center(
             //   child: Container(
             //                            width: 350,
             //                            decoration: BoxDecoration(
             //            color: Colors.white54,
             //            borderRadius: BorderRadius.circular(10)
             //                            ),
             //                            child: Padding(
             //            padding: const EdgeInsets.all(8.0),
             //            child: DropDownTextField(
             //
             //         textFieldDecoration: InputDecoration(
             //           border: InputBorder.none,
             //                        hintText: 'Repeat'.tr,
             //                        hintStyle: TextStyle(color: darkGreyColor,fontSize: 16,fontWeight: FontWeight.w500)
             //         ),
             //          // initialValue: "name4",
             //          // readOnly: false,
             //          controller: _cnt2,
             //          clearOption: true,
             //
             //          keyboardType: TextInputType.none,
             //          //autovalidateMode: AutovalidateMode.always,
             //          clearIconProperty: IconProperty(color: Colors.green,size: 20),
             //          searchDecoration: const InputDecoration(
             //             // hintText: "enter your custom hint text here"
             //              ),
             //         //  validator: (value) {
             //         //    if (value == null || value.isEmpty) {
             //         //      return "Required field";
             //         //    } else {
             //         //      return null;
             //         //    }
             //         //  },
             //          dropDownItemCount: 6,
             //
             //      dropDownList: const [
             //        DropDownValueModel(name: 'name1', value: "value1"),
             //        DropDownValueModel(
             //            name: 'name2',
             //            value: "value2",
             //            toolTipMsg:
             //                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
             //        DropDownValueModel(name: 'name3', value: "value3"),
             //        DropDownValueModel(
             //            name: 'name4',
             //            value: "value4",
             //            toolTipMsg:
             //                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
             //        DropDownValueModel(name: 'name5', value: "value5"),
             //        DropDownValueModel(name: 'name6', value: "value6"),
             //        DropDownValueModel(name: 'name7', value: "value7"),
             //        DropDownValueModel(name: 'name8', value: "value8"),
             //      ],
             //
             //          dropdownColor: whiteColor,
             //          dropDownIconProperty: IconProperty(color: appColor,size: 30),
             //          textStyle: TextStyle(fontSize: 13,color: appColor),
             //
             //          //dropDownList: init.searchD,
             //          onChanged: (val)async {
             //
             //            //await init.getPlaces(_cnt.dropDownValue?.value ?? '');
             //            //set();
             //            //init.searchD.clear();
             //
             //          },
             //        ),)),
             // ),
             
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: InkWell(
                // onTap: () async {
                //   // GetStorage().remove("alarmlist");
                //
                //
                //
                //
                //
                //   if(GetStorage().read('alarmid')==null){
                //     GetStorage().write('alarmid',1);
                //   }else{
                //     int id=GetStorage().read('alarmid');
                //     print(id.toString());
                //     GetStorage().write('alarmid',++id,);
                //     print(GetStorage().read('alarmid').toString()+'kfmwkoemif');
                //   }
                // try{
                //
                //   init.alarm=listalarmFromJson(GetStorage().read("alarmlist"));
                //
                // }catch(E){
                //   init.alarm=[];
                //
                //
                // }
                //   for(int i=0;i<init.Alarmadd1.length;i++){
                //     for(int j=0;j<init.Alarmadd1[i].hours.length;j++){
                //
                //      if(init.Alarmadd1[i].hours.length!=0){
                //        print(init.Alarmadd1[i].hours[j]);
                //        print(init.Alarmadd1[i].days);
                //        print("kjfioji");
                //        AwesomeNotifications().createNotification(
                //            content: NotificationContent(
                //              id:GetStorage().read('alarmid'),
                //
                //              channelKey: 'alarm_channel',
                //              title: 'Alarm',
                //              body: hcon.cnt.dropDownValue?.name??"Driking",
                //              locked: true,
                //
                //
                //              // bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
                //              // notificationLayout: NotificationLayout.BigPicture,
                //              displayOnBackground: true,
                //              displayOnForeground: true,
                //              customSound: "assets/Alarm Morning.mp3",
                //
                //
                //
                //
                //
                //
                //              fullScreenIntent: true,),
                //            actionButtons: [
                //              NotificationActionButton(key: 'snooze', label: 'SNOOZE'),
                //              NotificationActionButton(
                //                  key: 'STOP',
                //                  label: 'STOP',
                //                  // buttonType: ActionButtonType.DisabledAction,
                //
                //                  isDangerousOption: true)
                //            ],
                //            schedule:NotificationCalendar(
                //              allowWhileIdle: true,
                //              preciseAlarm: true,
                //              repeats: true,
                //              hour: init.Alarmadd1[i].hours[j]==24?0:init.Alarmadd1[i].hours[j],
                //              weekday: init.Alarmadd1[i].days,
                //              minute: 0,
                //              second: 0
                //            )
                //          //
                //
                //
                //
                //
                //        );
                //
                //      }
                //     }
                //
                //
                //   }
                //
                //
                //
                //   init.alarm.add(Listalarm(id: GetStorage().read('alarmid'), name:  hcon.cnt.dropDownValue?.name??"Driking", tunepath: '', content: '', alarm: init.Alarmadd1));
                //
                //   GetStorage().write("alarmlist", listalarmToJson(init.alarm));
                //   _showAlertDialog();
                //
                // },
                 onTap: () async {
                   print(GetStorage().read('linktune'));
                   // String timezom = await AwesomeNotifications()
                   //     .getLocalTimeZoneIdentifier();
                   //get time zone you are in
                   int id = GetStorage().read('alarmid')??1;
                     GetStorage().write('alarmid',++id);

                   final alarmSettings = AlarmSettings(
                       id: ++id,
                       dateTime: DateFormat("yyyy-MM-dd HH:mm").parse(
                           "${DateFormat("yyyy-MM-dd").format(DateTime.now())} ${hcon.selectedTime1.hour.toString()}:${hcon.selectedTime1.minute.toString()}"),
                       assetAudioPath: GetStorage().read('linktune')??'.mp3',
                       notificationTitle: "Alarm",
                       enableNotificationOnKill: true,
                       vibrate: false,
                       notificationBody: DateFormat.jmv().format(
                           DateFormat("yyyy-MM-dd HH:mm").parse(
                               "${DateFormat("yyyy-MM-dd").format(DateTime.now())} ${hcon.selectedTime1.hour.toString()}:${hcon.selectedTime1.minute.toString()}")), weekdays: selectedweekdays, loop: true);
                   Alarm.set(alarmSettings: alarmSettings);
                   _showAlertDialog();

                 },
                 child: Container(
                                  height: mHeight/16,
                                  width: mWidth/2,
                                  decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(8)),
                                  child: Center(child: Txt(text: 'Set Alarm'.tr,fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                  
                                ),
               ),
             ),
          ],
        ),
      ),
    ),);
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