import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:smartbells/base_client.dart';
import 'package:smartbells/view/profile/model/policy_model.dart';
import 'package:smartbells/view/profile/model/profile_detail_model.dart';
import 'package:smartbells/view/profile/model/profile_update_model.dart';
import 'package:smartbells/view/profile/model/term_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../api_endpoints.dart';
import '../../auth/controller/auth_controller.dart';
import '../model/audio_model.dart';
import '../model/banner_model.dart';
import '../model/event_model.dart';
import '../model/utilscal.dart';



class HomeCon extends GetxController with BaseController {

  List<DateTime> selecteddays1=[];
  DateTime focusedDay1 = DateTime.now();
  DateTime today = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  SingleValueDropDownController cnt=SingleValueDropDownController();
  TimeOfDay selectedTime1 =TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute+1)
 ;


  final Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );


  // MRegister? registerdata;
  // Future<void> registerFunc() async {
  //   var body = {
  //     'user_name': userNameCon.text,
  //     'user_emailid':emailCon.text,
  //     'user_mobileno': mobilesCon.text,
  //     'user_gender': val == 0 ? 'male' : 'female',
  //   };
  //   var response = await BaseClient()
  //       .post(API().register, body, isFormData: true)
  //       .catchError(handleError);
  //   if (response == null) return;
  //   registerdata = mRegisterFromJson(response);
  //   print('object' + response);
  //   showLoading();
  //   if (registerdata!.status == true) {
  //     hideLoading();
  //      Get.offAll(() => mobileNumber()); 
  //       mobilesCon.clear();
  //       userNameCon.clear();
  //       emailCon.clear();
  //       mobilesCon.clear();
  //       val = -1;

  //     // storage.write('userId', registerdata!.data?[0].userId);
  //     // print('id' + registerdata!.data![0].userId);
  //     //Get.offAll(BottomNavigaton());
  //     Fluttertoast.showToast(msg: registerdata!.msg);
  //     //sendotp.value = data['data'];
  //   } else {
  //     hideLoading();
  //     Fluttertoast.showToast(msg: registerdata!.msg.toString());
  //   }
  // }

  MBanner? bannerdata;
  Future<void>  onDaySelected(DateTime selectedDay, DateTime focusedDay) async {

    focusedDay1 = focusedDay;
    // Update values in a Set
    if (selectedDays.contains(selectedDay)) {
      selectedDays.remove(selectedDay);
      selecteddays1.remove(selectedDay);

    } else {
      selectedDays.add(selectedDay);
      selecteddays1.add(selectedDay);
    }
    ;}
  Future<void> bannerFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
    };
    var response = await BaseClient()
        .get(API().Banner, isFormData: true)
        .catchError(handleError);
    print('responsw' +response);
    if (response == null) return;
    bannerdata = mBannerFromJson(response);
    print('object' + response);
    showLoading();
    if (bannerdata!.status == true) {
      hideLoading(); 
      Fluttertoast.showToast(msg: bannerdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: bannerdata!.msg);
    }
  }

  MEvent? eventdata;
  List<DropDownValueModel> eventList = [];
  Future<void> eventFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
    };
    var response = await BaseClient()
        .get(API().event, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    eventdata = mEventFromJson(response);
    print('object' + response);
    showLoading();
    if (eventdata!.status == true) {
      hideLoading(); 
      for(int i = 0; i< eventdata!.data.events.length; i++){
        eventList.add(DropDownValueModel(
            name: '${eventdata!.data.events[i].events}',
            value: eventdata!.data.events[i].eventId));
      }
      Fluttertoast.showToast(msg: eventdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: eventdata!.msg);
    }
  }

  MAudio? audiodata;
  List<DropDownValueModel> audioList = [];
  List<Duration> duration = [];
  List<Duration> position = [];
  List<bool> isPlaying = [];
  List<bool> isLoading = [];
  List<bool> isPause = [];
  Future<void> audioFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
    };
    var response = await BaseClient()
        .get(API().tune, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    audiodata = mAudioFromJson(response);
    print('object' + response);
    showLoading();
    if (audiodata!.status == true) {
      hideLoading(); 
      duration.clear();
      position.clear();
      isPlaying.clear();
      isLoading.clear();
      isPause.clear();
      
    for (int i = 0; i < audiodata!.data.audio.length; i++) {
      // var demo = await  translator
      // .translate(audiodata!.data[i].audioTitle, to: 'ta');
      //   audioList.add(demo) ;
      duration.add(Duration(milliseconds: 0));
      position.add(Duration(milliseconds: 0));
      isPlaying.add(false);
      isLoading.add(false);
      isPause.add(false);
      // Fluttertoast.showToast(msg: audiodata!.msg.toString());
      //sendotp.value = data['data'];
    }
      // for(int i = 0; i< eventdata!.data.events.length; i++){
      //   eventList.add(DropDownValueModel(
      //       name: '${eventdata!.data.events[i].events}',
      //       value: eventdata!.data.events[i].eventId));
      // }
      Fluttertoast.showToast(msg: audiodata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: audiodata!.msg);
    }
  }



}