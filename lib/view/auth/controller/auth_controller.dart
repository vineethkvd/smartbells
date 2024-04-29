import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:smartbells/base_client.dart';
import 'package:smartbells/view/auth/view_auth/mobile_number.dart';
import 'package:smartbells/view/auth/view_auth/update.dart';

import '../../../api_endpoints.dart';
import '../../bottomsheet/view_bottom/bottomsheet.dart';
import '../model/loginmodel.dart';
import '../model/registermodel.dart';
import '../view_auth/otp.dart';

class AuthCon extends GetxController with BaseController {
   bool isObscure = true;
  bool isObscure1 = true;
  String? gender;
  bool value = false;
  int val = 0;
  // login
  final TextEditingController mobileCon = TextEditingController();
  var storage = GetStorage();
  //register
  final TextEditingController nameCon = TextEditingController();
   final TextEditingController alarmtype = TextEditingController();
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

  final TextEditingController confirmPasswordCon = TextEditingController();
  TextEditingController upload2 = TextEditingController();
  TextEditingController upload3 = TextEditingController();
  TextEditingController upload4 = TextEditingController();
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
  final TextEditingController otpCon = TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  // Future<void> login(token) async {
  //   var body = {
  //     'user_mobile': mobileCon.text,
  //     'user_password': passwordCon.text,
  //     'device_token' : token
  //   };
  //   var response = await BaseClient()
  //       .post(API().logIn, body, isFormData: true)
  //       .catchError(handleError);
  //   if (response == null) return;
  //   confirmLogin = mLoginFromJson(response);
  //   print('object' + response);
  //   showLoading();
  //   if (confirmLogin!.status == true) {
  //     hideLoading();
  //     storage.write('userId', confirmLogin!.data?[0].userId);
  //     print('id' + confirmLogin!.data![0].userId);
  //     Get.offAll(BottomNavigaton());
  //     mobileCon.clear();
  //     passwordCon.clear();
  //     Fluttertoast.showToast(msg: confirmLogin!.msg.toString());
  //     //sendotp.value = data['data'];
  //   } else {
  //     hideLoading();
  //     Fluttertoast.showToast(msg: confirmLogin!.msg.toString());
  //   }
  // }

  MRegister? registerdata;
  Future<void> registerFunc() async {
    var body = {
      'user_name': userNameCon.text,
      'user_emailid':emailCon.text,
      'user_mobileno': mobileCon.text,
      'user_gender': val == 0 ? 'male' : 'female',
    };
    print(body);
    var response = await BaseClient()
        .post(API().register, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    registerdata = mRegisterFromJson(response);
    print('object' + response);
    showLoading();
    if (registerdata!.status == true) {
      hideLoading();
       Get.offAll(() => mobileNumber()); 
        mobilesCon.clear();
        userNameCon.clear();
        emailCon.clear();
        mobilesCon.clear();
        val = -1;

      // storage.write('userId', registerdata!.data?[0].userId);
      // print('id' + registerdata!.data![0].userId);
      //Get.offAll(BottomNavigaton());
      Fluttertoast.showToast(msg: registerdata!.msg);
      //sendotp.value = data['data'];
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: registerdata!.msg.toString());
    }
  }

  MLogin? logindata;
  Future<void> loginFunc() async {
    var body = {
      'api_key': API().gapikey,
      'user_mobileno': mobileCon.text,
    };
    var response = await BaseClient()
        .post(API().logIn, body, isFormData: true)
        .catchError(handleError);
    if (response == null) return;
    logindata = mLoginFromJson(response);
    print('object' + response);
    showLoading();
    if (logindata!.status == true) {
      hideLoading(); 
       Get.off(() => otp());
       mobilesCon.clear();
       // storage.write('userId', logindata!.data![0].userId);
       // storage.write("username", logindata!.data![0].userName);
       print('id' + logindata!.data![0].userId.toString());
      //Get.offAll(BottomNavigaton());
      Fluttertoast.showToast(msg: logindata!.data![0].userOtp.toString());
      //sendotp.value = data['data'];
    } else {
      hideLoading();
      Get.to(update());
      Fluttertoast.showToast(msg: logindata!.msg.toString());
    }
  }


}