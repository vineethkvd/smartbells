import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../../controller/init.dart';
import '../homepage/view_home/daily_schedule.dart';

class alarmhour extends StatefulWidget {
  const alarmhour({Key? key}) : super(key: key);

  @override
  State<alarmhour> createState() => _alarmhourState();
}

class _alarmhourState extends State<alarmhour> {
  bool isSwitched = false;
  InitCon init = Get.put(InitCon());
  var dayList = [
    {
      "title": "Monday".tr,
    },
    {"title": "Tuesday".tr},
    {"title": "Wednesday".tr},
    {"title": "Thursday".tr},
    {"title": "Friday".tr},
    {"title": "Saturday".tr},
    {"title": "Sunday".tr},
  ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Container(
            height: mHeight * 0.8,
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        dayList[index]['title'] ?? '',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      init.Alarmadd1[index].hours.length != 0
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: init.Alarmadd1[index].hours.length,
                              itemBuilder: (BuildContext context, int index1) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width: mWidth / 1.1,
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ExpansionTile(
                                              backgroundColor: whiteColor,
                                              title: Text(
                                                'Time',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          DateFormat()
                                                              .add_jm()
                                                              .format(DateFormat("HH")
                                                                  .parse(init
                                                                      .Alarmadd1[
                                                                          index]
                                                                      .hours[
                                                                          index1]
                                                                      .toString())),
                                                          style: TextStyle(
                                                              fontSize: 32)),
                                                    ],
                                                  ),
                                                  // Row(
                                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //     children: [
                                                  //       Txt(text:"All Days",fsize: 16,color: darkGreyColor,),
                                                  //       Transform.scale(
                                                  //           scale: 1.2,
                                                  //           child: Switch(
                                                  //             onChanged:toggleSwitch,
                                                  //             value: isSwitched,
                                                  //             activeColor: appColor,
                                                  //             activeTrackColor: appColor,
                                                  //             inactiveThumbColor: greyColor,
                                                  //             inactiveTrackColor: greyColor,
                                                  //           )
                                                  //       ),
                                                  //     ]),
                                                ],
                                              ),
                                              children: <Widget>[
                                                ListTile(
                                                    title: Column(
                                                  children: [
                                                    //   SizedBox(
                                                    //   height: mHeight / 57,
                                                    //   width: mWidth / 1.14,
                                                    //   child: Divider(thickness: 1, color: blackColor),
                                                    // ),
                                                    // Row(
                                                    //     children: [
                                                    //       Text('Today'),]),
                                                    // Container(
                                                    //   height: 50,
                                                    //   child: ListView.builder(  physics: const NeverScrollableScrollPhysics(),
                                                    //       scrollDirection: Axis.horizontal,
                                                    //       shrinkWrap: true,
                                                    //       itemCount: daycount.length,
                                                    //       itemBuilder: (BuildContext context, int index){
                                                    //         return Padding(
                                                    //           padding:  EdgeInsets.all(10),
                                                    //           child: Center(child: InkWell(
                                                    //             onTap: (){
                                                    //               selectafternoon.value = index ;
                                                    //               print(index);
                                                    //             },
                                                    //             child: Obx(() =>  Container(
                                                    //               decoration: BoxDecoration(color:  selectafternoon == index ? appColor: Colors.transparent,borderRadius: BorderRadius.circular(16)),
                                                    //               child: Padding(
                                                    //                 padding: const EdgeInsets.all(5.0),
                                                    //                 child: Text( '${daycount[index]['days'].toString()}',
                                                    //
                                                    //                   style: TextStyle(
                                                    //                       fontWeight: FontWeight.w500,
                                                    //                       fontSize:  16,
                                                    //                       color: selectafternoon == index ? whiteColor : blackColor
                                                    //                   ),
                                                    //                 ),
                                                    //               ),
                                                    //             ),
                                                    //             ),
                                                    //           )),
                                                    //         );
                                                    //       }),
                                                    // ),
                                                    // SizedBox(
                                                    //   height: mHeight / 57,
                                                    //   width: mWidth / 1.14,
                                                    //   child: Divider(thickness: 1, color: blackColor),
                                                    // ),
                                                    // DropDownTextField(
                                                    //
                                                    //   textFieldDecoration: InputDecoration(
                                                    //       border: InputBorder.none,
                                                    //       hintText: 'Select Tune',
                                                    //       hintStyle: TextStyle(color: appColor,fontSize: 16,fontWeight: FontWeight.w500)
                                                    //   ),
                                                    //   // initialValue: "name4",
                                                    //   // readOnly: false,
                                                    //   // controller: _cnt,
                                                    //   clearOption: true,
                                                    //
                                                    //   keyboardType: TextInputType.none,
                                                    //   //autovalidateMode: AutovalidateMode.always,
                                                    //   clearIconProperty: IconProperty(color: Colors.green,size: 20),
                                                    //   searchDecoration: const InputDecoration(
                                                    //     // hintText: "enter your custom hint text here"
                                                    //   ),
                                                    //   //  validator: (value) {
                                                    //   //    if (value == null || value.isEmpty) {
                                                    //   //      return "Required field";
                                                    //   //    } else {
                                                    //   //      return null;
                                                    //   //    }
                                                    //   //  },
                                                    //   dropDownItemCount: 6,
                                                    //
                                                    //   dropDownList: const [
                                                    //     DropDownValueModel(name: 'name1', value: "value1"),
                                                    //     DropDownValueModel(
                                                    //         name: 'name2',
                                                    //         value: "value2",
                                                    //         toolTipMsg:
                                                    //         "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                                    //     DropDownValueModel(name: 'name3', value: "value3"),
                                                    //     DropDownValueModel(
                                                    //         name: 'name4',
                                                    //         value: "value4",
                                                    //         toolTipMsg:
                                                    //         "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                                    //     DropDownValueModel(name: 'name5', value: "value5"),
                                                    //     DropDownValueModel(name: 'name6', value: "value6"),
                                                    //     DropDownValueModel(name: 'name7', value: "value7"),
                                                    //     DropDownValueModel(name: 'name8', value: "value8"),
                                                    //   ],
                                                    //
                                                    //   dropdownColor: whiteColor,
                                                    //   dropDownIconProperty: IconProperty(color: appColor,size: 30),
                                                    //   textStyle: TextStyle(fontSize: 13,color: appColor),
                                                    //
                                                    //   //dropDownList: init.searchD,
                                                    //   onChanged: (val)async {
                                                    //
                                                    //     //await init.getPlaces(_cnt.dropDownValue?.value ?? '');
                                                    //     //set();
                                                    //     //init.searchD.clear();
                                                    //
                                                    //   },
                                                    // ),
                                                    SizedBox(
                                                      height: mHeight / 57,
                                                      width: mWidth / 1.14,
                                                      child: Divider(
                                                          thickness: 5,
                                                          color: greyColor),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        init.Alarmadd1[index]
                                                            .hours
                                                            .removeAt(index1);
                                                        print("delete");
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/delete.png',
                                                              scale: 4,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Txt(
                                                                text: "Delete",
                                                                fsize: 18,
                                                                color: appColor,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                )),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      width: mWidth / 1.1,
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                          title: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("No alarm Set"),
                                                ],
                                              ),
                                              // Row(
                                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //     children: [
                                              //       Txt(text:"All Days",fsize: 16,color: darkGreyColor,),
                                              //       Transform.scale(
                                              //           scale: 1.2,
                                              //           child: Switch(
                                              //             onChanged:toggleSwitch,
                                              //             value: isSwitched,
                                              //             activeColor: appColor,
                                              //             activeTrackColor: appColor,
                                              //             inactiveThumbColor: greyColor,
                                              //             inactiveTrackColor: greyColor,
                                              //           )
                                              //       ),
                                              //     ]),
                                            ],
                                          ),
                                          //   SizedBox(
                                          //   height: mHeight / 57,
                                          //   width: mWidth / 1.14,
                                          //   child: Divider(thickness: 1, color: blackColor),
                                          // ),
                                          // Row(
                                          //     children: [
                                          //       Text('Today'),]),
                                          // Container(
                                          //   height: 50,
                                          //   child: ListView.builder(  physics: const NeverScrollableScrollPhysics(),
                                          //       scrollDirection: Axis.horizontal,
                                          //       shrinkWrap: true,
                                          //       itemCount: daycount.length,
                                          //       itemBuilder: (BuildContext context, int index){
                                          //         return Padding(
                                          //           padding:  EdgeInsets.all(10),
                                          //           child: Center(child: InkWell(
                                          //             onTap: (){
                                          //               selectafternoon.value = index ;
                                          //               print(index);
                                          //             },
                                          //             child: Obx(() =>  Container(
                                          //               decoration: BoxDecoration(color:  selectafternoon == index ? appColor: Colors.transparent,borderRadius: BorderRadius.circular(16)),
                                          //               child: Padding(
                                          //                 padding: const EdgeInsets.all(5.0),
                                          //                 child: Text( '${daycount[index]['days'].toString()}',
                                          //
                                          //                   style: TextStyle(
                                          //                       fontWeight: FontWeight.w500,
                                          //                       fontSize:  16,
                                          //                       color: selectafternoon == index ? whiteColor : blackColor
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //             ),
                                          //           )),
                                          //         );
                                          //       }),
                                          // ),
                                          // SizedBox(
                                          //   height: mHeight / 57,
                                          //   width: mWidth / 1.14,
                                          //   child: Divider(thickness: 1, color: blackColor),
                                          // ),
                                          // DropDownTextField(
                                          //
                                          //   textFieldDecoration: InputDecoration(
                                          //       border: InputBorder.none,
                                          //       hintText: 'Select Tune',
                                          //       hintStyle: TextStyle(color: appColor,fontSize: 16,fontWeight: FontWeight.w500)
                                          //   ),
                                          //   // initialValue: "name4",
                                          //   // readOnly: false,
                                          //   // controller: _cnt,
                                          //   clearOption: true,
                                          //
                                          //   keyboardType: TextInputType.none,
                                          //   //autovalidateMode: AutovalidateMode.always,
                                          //   clearIconProperty: IconProperty(color: Colors.green,size: 20),
                                          //   searchDecoration: const InputDecoration(
                                          //     // hintText: "enter your custom hint text here"
                                          //   ),
                                          //   //  validator: (value) {
                                          //   //    if (value == null || value.isEmpty) {
                                          //   //      return "Required field";
                                          //   //    } else {
                                          //   //      return null;
                                          //   //    }
                                          //   //  },
                                          //   dropDownItemCount: 6,
                                          //
                                          //   dropDownList: const [
                                          //     DropDownValueModel(name: 'name1', value: "value1"),
                                          //     DropDownValueModel(
                                          //         name: 'name2',
                                          //         value: "value2",
                                          //         toolTipMsg:
                                          //         "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                          //     DropDownValueModel(name: 'name3', value: "value3"),
                                          //     DropDownValueModel(
                                          //         name: 'name4',
                                          //         value: "value4",
                                          //         toolTipMsg:
                                          //         "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                          //     DropDownValueModel(name: 'name5', value: "value5"),
                                          //     DropDownValueModel(name: 'name6', value: "value6"),
                                          //     DropDownValueModel(name: 'name7', value: "value7"),
                                          //     DropDownValueModel(name: 'name8', value: "value8"),
                                          //   ],
                                          //
                                          //   dropdownColor: whiteColor,
                                          //   dropDownIconProperty: IconProperty(color: appColor,size: 30),
                                          //   textStyle: TextStyle(fontSize: 13,color: appColor),
                                          //
                                          //   //dropDownList: init.searchD,
                                          //   onChanged: (val)async {
                                          //
                                          //     //await init.getPlaces(_cnt.dropDownValue?.value ?? '');
                                          //     //set();
                                          //     //init.searchD.clear();
                                          //
                                          //   },
                                          // ),
                                          // SizedBox(
                                          //   height: mHeight / 57,
                                          //   width: mWidth / 1.14,
                                          //   child: Divider(thickness: 5, color: greyColor),
                                          // ),
                                          // Row(
                                          //     mainAxisAlignment: MainAxisAlignment.start,
                                          //     children: [
                                          //       InkWell(
                                          //         onTap: (){},
                                          //         child: Image.asset('assets/images/delete.png',scale: 4,),
                                          //       ),
                                          //       Padding(
                                          //         padding: const EdgeInsets.all(10.0),
                                          //         child: Txt(text:"Delete",fsize: 18,color: appColor,weight: FontWeight.w500,),
                                          //       ),
                                          //     ]),
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(dailySchedule());
                  },
                  child: Container(
                    height: mHeight / 18,
                    width: mWidth / 3,
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Txt(
                      text: 'Next',
                      fsize: 16,
                      weight: FontWeight.bold,
                      color: whiteColor,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
