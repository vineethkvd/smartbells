import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:alarm/service/storage.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smartbells/common/base_colors.dart';

import '../../../common/text.dart';
import 'bottomsheet.dart';

class alarm extends StatefulWidget {
  const alarm({super.key});

  @override
  State<alarm> createState() => _alarmState();
}

class _alarmState extends State<alarm> {
  bool isSwitched = false;
  void toggleSwitch(int id,isSwitched,AlarmSettings alarm) {
    alarm.status=isSwitched;
    if(! alarm.loop&&isSwitched)
    alarm.dateTime=alarm.dateTime.isBefore(DateTime.now())?alarm.dateTime.add(Duration(hours: 24)): alarm.dateTime;
    AlarmStorage.updatealarm(alarm,id).then((res) {
      // if (res) Navigator.pop(context, true);
    });
    loadAlarms();
  

    setState(() {

    });
  }
  late List<AlarmSettings> alarms;
  void loadAlarms() {

    alarms = Alarm.getAlarms();
    print(alarms.length);
    alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0: 1);
    setState(() {

    });

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _cnt1;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cnt1 = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    loadAlarms();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cnt1.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  var selectafternoon = 8.obs;
  var daycount= [

    {"days" : "M"},
    {"days" : "T"},
    {"days" : "W"},
    {"days" : "T"},
    {"days" : "F"},
    {"days" : "S"},
    {"days" : "S"},
  ].obs;
  var daycount1= [

    {"days" : "Mon"},
    {"days" : "Tue"},
    {"days" : "Wed"},
    {"days" : "Thu"},
    {"days" : "Fri"},
    {"days" : "Sat"},
    {"days" : "Sun"},
  ].obs;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('knr');
        Get.to(Bottomsheet());
      },backgroundColor: appColor,child: Icon(Icons.add,color: whiteColor,size: 35,)),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      // leading: IconButton(
                      //   onPressed: (){
                      //     Get.back();
                      //   },
                      //  icon: Icon(Icons.arrow_back_rounded,
                      //  size: 40,
                      //  color: blackColor,)),
       ),
      backgroundColor: greyColor,


      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.5,
                scale: 6,

                image: AssetImage('assets/images/clock-01.png',)
            )

        ),
       child:  Container(
            height: mHeight / 1.1,
         child: alarms.isNotEmpty? ListView.builder(

             physics: const AlwaysScrollableScrollPhysics(),
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             itemCount: alarms.length,
             itemBuilder: (BuildContext context, int index){
               return  Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   children: <Widget>[
                     Center(
                       child: Container(
                         width: mWidth/1.1,
                         decoration: BoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(10)),
                         child: ExpansionTile(
                           backgroundColor: whiteColor,

                           title: Text('Alarm'),
                           subtitle: Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(DateFormat().add_jm().format(alarms[index].dateTime
                                   ),style: TextStyle(fontSize: 32)),

                                   !alarms[index].weekdays.isNotEmpty?Container():Transform.scale(
                                       scale: 1.2,
                                       child: Switch(
                                         onChanged: (val){
                                           alarms[index].status=val;

                                           toggleSwitch(alarms[index].id, alarms[index].status,alarms[index]);
                                         },
                                         value: alarms[index].status,
                                         activeColor: appColor,
                                         activeTrackColor: appColor,
                                         inactiveThumbColor: greyColor,
                                         inactiveTrackColor: greyColor,
                                       )
                                   ),
                                 ],
                               ),
                               alarms[index].weekdays.isNotEmpty?alarms[index].weekdays.isEmpty?Container():Container(
                                 alignment: Alignment.centerLeft,
                                 height: 30,
                                 child: ListView.builder(  physics: const NeverScrollableScrollPhysics(),
                                     scrollDirection: Axis.horizontal,
                                     shrinkWrap: true,
                                     itemCount: daycount.length,
                                     itemBuilder: (BuildContext context, int index1){
                                       return Padding(
                                         padding:  EdgeInsets.all(0),
                                         child: Center(child: InkWell(
                                           onTap: (){
                                             selectafternoon.value = index ;
                                             print(index);
                                           },
                                           child:  Container(

                                             child: alarms[index].weekdays.contains(index1+1)?Center(

                                               child: Text( '${daycount1[index1]['days'].toString()} ',

                                                 style: TextStyle(
                                                     fontWeight: FontWeight.w500,
                                                     fontSize:  13,
                                                     color: alarms[index].weekdays.contains(index1+1)  ? blackColor : Colors.transparent
                                                 ),
                                               ),
                                             ):Container(),
                                           ),

                                         )),
                                       );
                                     }),
                               ):Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                      Txt(text:DateFormat.yMMMd().format(alarms[index].dateTime
                                     ),fsize: 16,color: darkGreyColor,),
                                     Transform.scale(
                                         scale: 1.2,
                                         child: Switch(
                                           onChanged: (val){
                                             alarms[index].status=val;

                                             toggleSwitch(alarms[index].id, alarms[index].status,alarms[index]);
                                           },
                                           value: alarms[index].status,
                                           activeColor: appColor,
                                           activeTrackColor: appColor,
                                           inactiveThumbColor: greyColor,
                                           inactiveTrackColor: greyColor,
                                         )
                                     ),
                                   ]),
                             ],
                           ),
                           children: [
                             // alarms[index].weekdays.isEmpty?Container():Container(
                             //   height: 50,
                             //   child: ListView.builder(  physics: const NeverScrollableScrollPhysics(),
                             //       scrollDirection: Axis.horizontal,
                             //       shrinkWrap: true,
                             //       itemCount: daycount.length,
                             //       itemBuilder: (BuildContext context, int index1){
                             //         return Padding(
                             //           padding:  EdgeInsets.all(5),
                             //           child: Center(child: InkWell(
                             //             onTap: (){
                             //               selectafternoon.value = index ;
                             //               print(index);
                             //             },
                             //             child: Obx(() =>  Container(
                             //               child: CircleAvatar(
                             //                 radius: 15,
                             //                 backgroundColor:  alarms[index].weekdays.contains(index1+1) ? appColor: Colors.transparent,
                             //
                             //                 child: Center(
                             //
                             //                   child: Text( '${daycount[index1]['days'].toString()}',
                             //
                             //                     style: TextStyle(
                             //                         fontWeight: FontWeight.w500,
                             //                         fontSize:  16,
                             //                         color: alarms[index].weekdays.contains(index1+1)  ? whiteColor : blackColor
                             //                     ),
                             //                   ),
                             //                 ),
                             //               ),
                             //             ),
                             //             ),
                             //           )),
                             //         );
                             //       }),
                             // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(

                                    onPressed: (){
                                      Alarm.delete(alarms[index].id);
                                      loadAlarms();

                                    }, child:Text('Delete'),
                                style: ButtonStyle(

                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),

                                ),)))
                              ],
                            )
                           ],
                         ),
                       ),
                     ),

                   ],
                 ),
               );}
         ):Center(
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

      ),
    ));
  }
}
