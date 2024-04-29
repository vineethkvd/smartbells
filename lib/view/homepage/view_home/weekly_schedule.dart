import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:smartbells/view/homepage/view_home/tune.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../bottomsheet/view_bottom/bottomsheet.dart';
import '../controller/home_controller.dart';

import '../model/utilscal.dart';

class weeklySchedule extends StatefulWidget {
  const weeklySchedule({super.key});

  @override
  State<weeklySchedule> createState() => _weeklyScheduleState();
}

class _weeklyScheduleState extends State<weeklySchedule> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HomeCon homecon = Get.put(HomeCon());

  bool isSwitched = false;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDates = DateTime.now();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  late SingleValueDropDownController _cnt1;
  late MultiValueDropDownController _cntMulti;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectDates(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedDates,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDates) {
      setState(() {
        selectedDates = picked;
      });
    }
  }

  DateTime today = DateTime.now();

  void _onDaySelected(
    DateTime day,
    DateTime focusedDay,
  ) {
    setState(() {
      today = day;
    });
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        //textValue = 'Switch Button is ON';
      });
      print(isSwitched);
    } else {
      setState(() {
        isSwitched = false;
        //textValue = 'Switch Button is OFF';
      });
      print(isSwitched);
    }
  }

  getrecord() async {
    await homecon.eventFunc();
    await homecon.audioFunc();
    setState(() {});
  }

  @override
  void initState() {
    getrecord();


    _cntMulti = MultiValueDropDownController();
    getrecord();

    super.initState();
  }

  @override
  void dispose() {
    homecon.cnt.dispose();
    _cnt1.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 40,
                color: blackColor,
              )),
        ),
        backgroundColor: greyColor,
        body: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
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
                      formatButtonVisible: false, titleCentered: true),
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
              // SizedBox(height: 15,),
              //  Center(
              //    child: Container(
              //                             width: 350,
              //                             decoration: BoxDecoration(
              //             color: whiteColor,
              //             borderRadius: BorderRadius.circular(10)
              //                             ),
              //                             child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: TextFormField(
              //               //controller: acon.passwordCon,
              //                 decoration: InputDecoration(
              //                 border: InputBorder.none,
              //                // border: OutlineInputBorder(),
              //                  prefix: Txt(text:'  '),
              //                 // filled: true,
              //                 // fillColor: greyColor,
              //                 hintText: 'Meeting',
              //                 hintStyle: TextStyle(color: darkGreyColor,fontWeight: FontWeight.w500,fontSize: 16)
              //               ),
              //               autofocus: false,
              //             ),)),
              //  ),
              // SizedBox(height: 15,),
              // Center(child:
              //  Container(
              //      width: 350,
              //      height: 64,
              //      decoration: BoxDecoration(
              //             color: whiteColor,
              //              borderRadius: BorderRadius.circular(10)),
              //      child: Padding(
              //        padding: const EdgeInsets.all(15.0),
              //        child: Row(
              //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //          children: [
              //          Txt(text:"All Days",fsize: 16,color: darkGreyColor,),
              //            Transform.scale(
              //      scale: 1,
              //      child: Switch(
              //        onChanged: toggleSwitch,
              //        value: isSwitched,
              //        activeColor: appColor,
              //        activeTrackColor: appColor,
              //        inactiveThumbColor: greyColor,
              //        inactiveTrackColor: greyColor,
              //      )
              //    ),
              //        ]),
              //      ),
              //    ),),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 64,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(
                            text:
                                "${homecon.selectedTime.hour} : ${homecon.selectedTime.minute}",
                            fsize: 16,
                            color: darkGreyColor,
                          ),
                          InkWell(
                              onTap: () async {
                                final TimeOfDay? timeOfDay =
                                    await showTimePicker(
                                  context: context,
                                  initialTime: homecon.selectedTime,
                                  initialEntryMode: TimePickerEntryMode.dial,
                                );
                                if (timeOfDay != null) {
                                  setState(() {
                                    homecon.selectedTime = timeOfDay;
                                  });
                                  print(homecon.selectedTime);
                                  print(homecon.selecteddays1[0]);
                                  print(DateFormat("yyyy-MM-dd HH:mm").parse(
                                      "${DateFormat("yyyy-MM-dd").format(homecon.selecteddays1[0]).toString()} ${homecon.selectedTime.hour.toString()}:${homecon.selectedTime.minute.toString()}"));
                                  //Get.to(dailySchedule());
                                }
                              },
                              child: Icon(
                                Icons.alarm,
                                color: appColor,
                              ))
                        ]),
                  ),
                ),
              ),
              //      SizedBox(height: 15,),
              // Center(child:
              //  Container(
              //      width: 350,
              //      height: 64,
              //      decoration: BoxDecoration(
              //             color: whiteColor,
              //              borderRadius: BorderRadius.circular(10)),
              //      child: Padding(
              //        padding: const EdgeInsets.all(15.0),
              //        child: Row(
              //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //          children: [
              //          Txt(text:"${selectedDate.day.toString()}-${selectedDate.month.toString()}-${selectedDate.year.toString()}".split(' ')[0],fsize: 16,color: darkGreyColor,),
              //          InkWell(
              //            onTap: () => _selectDate(context),
              //
              //            child: Icon(Icons.calendar_month_outlined,color: appColor,))
              //        ]),
              //      ),
              //    ),),
              // SizedBox(height: 15,),
              // Center(child:
              //  Container(
              //      width: 350,
              //      height: 64,
              //      decoration: BoxDecoration(
              //             color: whiteColor,
              //              borderRadius: BorderRadius.circular(10)),
              //      child: Padding(
              //        padding: const EdgeInsets.all(15.0),
              //        child: Row(
              //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //          children: [
              //          Txt(text:"${selectedDates.day.toString()}-${selectedDates.month.toString()}-${selectedDates.year.toString()}".split(' ')[0],fsize: 16,color: darkGreyColor,),
              //          InkWell(
              //            onTap: () => _selectDates(context),
              //
              //            child: Icon(Icons.calendar_month_outlined,color: appColor,))
              //        ]),
              //      ),
              //    ),),

              //    SizedBox(height: 15,),
              // Center(
              //   child: Container(
              //                            width: 350,
              //                            decoration: BoxDecoration(
              //            color: whiteColor,
              //            borderRadius: BorderRadius.circular(10)
              //                            ),
              //                            child: Padding(
              //            padding: const EdgeInsets.all(8.0),
              //            child: DropDownTextField(
              //
              //         textFieldDecoration: InputDecoration(
              //           border: InputBorder.none,
              //                        hintText: 'Select Tune'.tr,
              //                        hintStyle: TextStyle(color: darkGreyColor,fontSize: 16,fontWeight: FontWeight.w500)
              //         ),
              //          // initialValue: "name4",
              //          // readOnly: false,
              //          controller: _cnt,
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
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownTextField(
                        textFieldDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Select Event'.tr,
                            hintStyle: TextStyle(
                                color: darkGreyColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        // initialValue: "name4",
                        // readOnly: false,
                        controller: homecon.cnt,
                        clearOption: true,

                        keyboardType: TextInputType.none,
                        //autovalidateMode: AutovalidateMode.always,
                        clearIconProperty:
                            IconProperty(color: Colors.green, size: 20),
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

                        dropDownList: homecon.eventList,
                        dropdownColor: whiteColor,
                        dropDownIconProperty:
                            IconProperty(color: appColor, size: 30),
                        textStyle: TextStyle(fontSize: 13, color: appColor),

                        //dropDownList: init.searchD,
                        onChanged: (val) async {
                          homecon.eventList.clear();
                          //await init.getPlaces(_cnt.dropDownValue?.value ?? '');
                          //set();
                          //init.searchD.clear();
                        },
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(Audio(
                      audio: 'week',
                    ));
                  },
                  child: Container(
                      width: 350,
                      height: 62,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Txt(
                                  text: GetStorage().read("linkname") == null
                                      ? 'Select Tune'
                                      : GetStorage().read("linkname"),
                                  color: darkGreyColor,
                                  fsize: 13,
                                  weight: FontWeight.w500),
                              width: 300,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: appColor,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
              // SizedBox(height: 15,),
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
              //                        hintText: 'Select Tune'.tr,
              //                        hintStyle: TextStyle(color: darkGreyColor,fontSize: 16,fontWeight: FontWeight.w500)
              //         ),
              //          // initialValue: "name4",
              //          // readOnly: false,
              //          controller: _cnt1,
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
                  onTap: () {
                    if (GetStorage().read('alarmid') == null) {
                      GetStorage().write('alarmid', 1);
                    } else {
                      int id = GetStorage().read('alarmid');
                      print(id.toString());
                      GetStorage().write(
                        'alarmid',
                        ++id,
                      );
                      print(GetStorage().read('alarmid').toString() +
                          'kfmwkoemif');
                    }
                    for (int i = 0; i < homecon.selecteddays1.length; i++) {
                      final alarmSettings = AlarmSettings(

                          id: GetStorage().read('alarmid'),
                          dateTime: DateFormat("yyyy-MM-dd HH:mm").parse(
                              "${DateFormat("yyyy-MM-dd").format(homecon.selecteddays1[i]).toString()} ${homecon.selectedTime.hour.toString()}:${homecon.selectedTime.minute.toString()}"),
                          assetAudioPath: GetStorage().read('linktune'),
                          notificationTitle:
                          homecon.cnt.dropDownValue?.name ?? 'Alarm',
                          enableNotificationOnKill: true,
                          vibrate: false,

                          notificationBody: DateFormat.yMMMMEEEEd().add_jmv().format(DateFormat("yyyy-MM-dd HH:mm")
                              .parse(
                              "${DateFormat("yyyy-MM-dd").format(homecon.selecteddays1[i]).toString()} ${homecon.selectedTime.hour.toString()}:${homecon.selectedTime.minute.toString()}"))
                              .toString(), weekdays: [], loop: false);

                      Alarm.set(alarmSettings: alarmSettings);
                      int id = GetStorage().read('alarmid');
                      GetStorage().write(
                        'alarmid',
                        ++id,
                      );
                    }
                    _showAlertDialog();
                  },
                  child: Container(
                    height: mHeight / 16,
                    width: mWidth / 2,
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
            ],
          ),
        ),
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
