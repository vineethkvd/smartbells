import 'dart:async';
import 'dart:convert';

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

import '../../../api_endpoints.dart';
import '../../auth/controller/auth_controller.dart';
import '../model/about_model.dart';
import '../model/support_model.dart';


class ProfileCon extends GetxController with BaseController {
   bool isObscure = true;
  bool isObscure1 = true;
  String? gender;
  bool value = false;
  int val = -1;
  // login
  final TextEditingController mobileCon = TextEditingController();
  var storage = GetStorage();
  //register
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController mailCon = TextEditingController();
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController mobilesCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController VehicleNumCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController Instructions = TextEditingController();
  final TextEditingController carnumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController districtcon = TextEditingController();
  final TextEditingController statecon = TextEditingController();
  final TextEditingController ReferralIDcon = TextEditingController();
  final TextEditingController addresscon = TextEditingController();
  final TextEditingController DateController = TextEditingController();
  final TextEditingController DatetoController = TextEditingController();
  var selectGender = "Male".obs;

  //token
  String? token;

  //ll
 
  bool? isLoaded;
  var lat;
  var lon;
  var timeNotifier = ''.obs;

  //background
  //var task ='firstTask';
  //otp
  final TextEditingController supportCon = TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();


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

  MSupport? supportdata;
  Future<void> supportFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
      'complaint_content': supportCon.text,
      'sup_id': UserID,
    };
    var response = await BaseClient()
        .post(API().support, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    supportdata = mSupportFromJson(response);
    print('object' + response);
    showLoading();
    if (supportdata!.status == true) {
      hideLoading(); 
      Fluttertoast.showToast(msg: supportdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: supportdata!.msg);
    }
  }
  
  MPolicy? privacydata;
  Future<void> privacyFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
      'policy_id': '1',
    };
    var response = await BaseClient()
        .post(API().privacy, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    privacydata = mPolicyFromJson(response);
    print('object' + response);
    showLoading();
    if (privacydata!.status == true) {
      hideLoading(); 
      Fluttertoast.showToast(msg: privacydata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: privacydata!.msg);
    }
  }

  MTerm? termdata;
  Future<void> termFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
      'term_id': '1',
    };
    var response = await BaseClient()
        .post(API().terms, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    termdata = mTermFromJson(response);
    print('object' + response);
    showLoading();
    if (termdata!.status == true) {
      hideLoading(); 
      Fluttertoast.showToast(msg: termdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: termdata!.msg);
    }
  }
  

  MAbout? aboutdata;
  Future<void> aboutFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
      'about_id': '1',
    };
    var response = await BaseClient()
        .post(API().about, body, isFormData: true)
        .catchError(handleError);
    print(response);
    if (response == null) return;
    aboutdata = mAboutFromJson(response);
    print('object' + response);
    showLoading();
    if (aboutdata!.status == true) {
      hideLoading(); 
      Fluttertoast.showToast(msg: aboutdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: aboutdata!.msg);
    }
  }
  
  MProfileDetail? profiledata;
  Future<void> profileFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
      'user_id': UserID,
    };
    var response = await BaseClient()
        .post(API().profiledetail, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    profiledata = mProfileDetailFromJson(response);
    print('object' + response);
    showLoading();
    if (profiledata!.status == true) {
      hideLoading(); 
      userNameCon.text = profiledata!.data.userName.toString();
      emailCon.text = profiledata!.data.userEmailid.toString();
      mobilesCon.text = profiledata!.data.userMobileno.toString();
      // if(profiledata!.data.userGender.toString() == "male")
      // {
      //   val = 0;
      // } else {
      //   val = 1;
        
      // }
      Fluttertoast.showToast(msg: profiledata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: profiledata!.msg);
    }
  }

  MProfileUpdate? updatedata;
  Future<void> updateFunc() async {
    AuthCon acon = Get.put(AuthCon());
    var UserID = acon.storage.read('userId');
    var body = {
      'user_id' : UserID,
      'user_name': userNameCon.text,
      'user_emailid':emailCon.text,
      'user_mobileno': mobilesCon.text,
      'user_gender': val == 0 ? 'male' : 'female',
    };
    var response = await BaseClient()
        .post(API().profileupdate, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    updatedata = mProfileUpdateFromJson(response);
    print('object' + response);
    showLoading();
    if (updatedata!.status == true) {
      hideLoading();

      // storage.write('userId', registerdata!.data?[0].userId);
      // print('id' + registerdata!.data![0].userId);
      //Get.offAll(BottomNavigaton());
      Fluttertoast.showToast(msg: updatedata!.msg);
      //sendotp.value = data['data'];
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: updatedata!.msg);
    }
  }

}