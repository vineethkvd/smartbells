import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbells/common/base_colors.dart';
import 'package:smartbells/common/text.dart';

import '../../../controller/init.dart';
import '../../alarmscreen/hourlyalarm.dart';
import '../model/alarmmodel.dart';
import '../model/hourlymodern.dart';

class hourly extends StatefulWidget {
  const hourly({super.key});

  @override
  State<hourly> createState() => _hourlyState();
}

class _hourlyState extends State<hourly> {
  InitCon init = Get.put(InitCon());
  var selectmorning = 9.obs;
  var selectafternoon = 9.obs;
  var selectnight = 9.obs;
  List<hourlyba> morningcount1 = [];
  List<hourlyba> afternooncount1 = [];
  List<hourlyba> nightcountho1 = [];
  List<flowlist> weeklyl = [];

  Alarmadd singlealarm = Alarmadd(hours: [], days: 0);

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
  var nightcount = [
    {"num": 9},
    {"num": 10},
    {"num": 11},
    {"num": 12},
    {"num": 1},
    {"num": 2},
    {"num": 3},
    {"num": 4},
  ].obs;

  int i = 0;
  void initState() {
    init.Alarmadd1 = [];
    while (i < dayList.length) {
      int num = 5;
      int num1 = 1;
      while (num1 <= 8) {
        afternooncount1.add(hourlyba(hour: num1++, id: i));
      }
      while (num <= 12) {
        morningcount1.add(hourlyba(hour: num++, id: i));
      }
      int k = 0;
      while (k < nightcount.length) {
        nightcountho1.add(hourlyba(hour: nightcount[k]['num'] ?? 0, id: i));
        k++;
      }
      weeklyl.add(flowlist(
          morningcount: morningcount1,
          afternooncount: afternooncount1,
          nightcountho: nightcountho1,
          id: i));
      i++;
      afternooncount1 = [];
      morningcount1 = [];
      nightcountho1 = [];
      init.Alarmadd1.add(Alarmadd(hours: [], days: i));
    }
    print(weeklyl[0].afternooncount[0].hour.toString() + "iojfijwiejf");
    print(weeklyl.length);

    // TODO: implement initState
    super.initState();
  }

  var selectAge = 40.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mWidth / 1.1,
                color: Colors.white,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dayList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Txt(
                              text: "${dayList[index]['title']}",
                              fsize: 16,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: mWidth / 1.17,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.5, color: appColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Txt(
                                        color: appColor,
                                        fsize: 16,
                                        weight: FontWeight.w500,
                                        text: 'Morning(AM)'.tr,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount:
                                          weeklyl[index].morningcount.length,
                                      itemBuilder:
                                          (BuildContext context, int index1) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 2.7,
                                              top: 10,
                                              bottom: 10),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () {
                                              print(index);
                                              if (weeklyl[index]
                                                  .morningcount[index1]
                                                  .status) {
                                                weeklyl[index]
                                                    .morningcount[index1]
                                                    .status = false;
                                                init.Alarmadd1[index].hours
                                                    .remove(weeklyl[index]
                                                        .morningcount[index1]
                                                        .hour);
                                              } else {
                                                init.Alarmadd1[index].hours.add(
                                                    weeklyl[index]
                                                        .morningcount[index1]
                                                        .hour);

                                                weeklyl[index]
                                                    .morningcount[index1]
                                                    .status = true;
                                              }
                                              print(
                                                  init.Alarmadd1[index].hours);
                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: weeklyl[index]
                                                          .morningcount[index1]
                                                          .status
                                                      ? appColor
                                                      :lightgreenblueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Center(
                                                  child: Text(
                                                    '${weeklyl[index].morningcount[index1].hour}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: weeklyl[index]
                                                                .morningcount[
                                                                    index1]
                                                                .status
                                                            ? whiteColor
                                                            : whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Txt(
                                        color: appColor,
                                        fsize: 16,
                                        weight: FontWeight.w500,
                                        text: 'Afternoon(PM)'.tr,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount:
                                          weeklyl[index].afternooncount.length,
                                      itemBuilder:
                                          (BuildContext context, int index2) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 4,
                                              top: 10,
                                              bottom: 10),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () {
                                              if (weeklyl[index]
                                                  .afternooncount[index2]
                                                  .status) {
                                                weeklyl[index]
                                                    .afternooncount[index2]
                                                    .status = false;
                                                init.Alarmadd1[index].hours
                                                    .remove(weeklyl[index]
                                                            .afternooncount[
                                                                index2]
                                                            .hour +
                                                        12);
                                              } else {
                                                init.Alarmadd1[index].hours.add(
                                                    weeklyl[index]
                                                            .afternooncount[
                                                                index2]
                                                            .hour +
                                                        12);

                                                weeklyl[index]
                                                    .afternooncount[index2]
                                                    .status = true;
                                              }
                                              print(
                                                  init.Alarmadd1[index].hours);
                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: weeklyl[index]
                                                          .afternooncount[
                                                              index2]
                                                          .status
                                                      ? appColor
                                                      :lightgreenblueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  weeklyl[index]
                                                      .afternooncount[index2]
                                                      .hour
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: weeklyl[index]
                                                              .afternooncount[
                                                                  index2]
                                                              .status
                                                          ? whiteColor
                                                          : whiteColor),
                                                ),
                                              ),
                                            ),
                                          )),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Txt(
                                        color: appColor,
                                        fsize: 16,
                                        weight: FontWeight.w500,
                                        text: 'Night(PM)'.tr,

                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: nightcount.length,
                                      itemBuilder:
                                          (BuildContext context, int index3) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 3,
                                              top: 10,
                                              bottom: 10),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () {
                                              if (weeklyl[index]
                                                  .nightcountho[index3]
                                                  .status) {
                                                weeklyl[index]
                                                    .nightcountho[index3]
                                                    .status = false;
                                                if (weeklyl[index]
                                                        .nightcountho[index3]
                                                        .hour >
                                                    5) {
                                                  init.Alarmadd1[index].hours
                                                      .remove(weeklyl[index]
                                                              .nightcountho[
                                                                  index3]
                                                              .hour +
                                                          12);
                                                } else {
                                                  init.Alarmadd1[index].hours
                                                      .remove(weeklyl[index]
                                                          .nightcountho[index3]
                                                          .hour);
                                                }
                                              } else {
                                                weeklyl[index]
                                                    .nightcountho[index3]
                                                    .status = true;
                                                if (weeklyl[index]
                                                        .nightcountho[index3]
                                                        .hour >
                                                    5) {
                                                  init.Alarmadd1[index].hours
                                                      .add(weeklyl[index]
                                                              .nightcountho[
                                                                  index3]
                                                              .hour +
                                                          12);
                                                } else {
                                                  init.Alarmadd1[index].hours
                                                      .add(weeklyl[index]
                                                          .nightcountho[index3]
                                                          .hour);
                                                }
                                              }
                                              print(
                                                  init.Alarmadd1[index].hours);
                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: weeklyl[index]
                                                          .nightcountho[index3]
                                                          .status
                                                      ? appColor
                                                      :lightgreenblueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  '${weeklyl[index].nightcountho[index3].hour}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: weeklyl[index]
                                                              .nightcountho[
                                                                  index3]
                                                              .status
                                                          ? whiteColor
                                                          : whiteColor),
                                                ),
                                              ),
                                            ),
                                          )),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          )
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       print(alarmaddToJson(init.Alarmadd1));
          //       Get.to(alarmhour());
          //     },
          //     child: Container(
          //       height: mHeight / 18,
          //       width: mWidth / 3,
          //       decoration: BoxDecoration(
          //           color: appColor, borderRadius: BorderRadius.circular(8)),
          //       child: Center(
          //           child: Txt(
          //         text: 'Set Alarm',
          //         fsize: 16,
          //         weight: FontWeight.bold,
          //         color: whiteColor,
          //       )),
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}
