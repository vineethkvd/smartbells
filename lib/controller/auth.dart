// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../api_endpoints.dart';
// import '../base_client.dart';
// import 'init.dart';
// import 'package:http/http.dart' as http;

// class AuthCon extends GetxController with BaseController {
//   // login
//   final TextEditingController userNameCon = TextEditingController();
//   final TextEditingController passwordCon = TextEditingController();
//   final TextEditingController amountCon = TextEditingController();
//   var lobs = true.obs;
//   var otp = ''.obs;
//   var driverid = ''.obs;
//   var driverUnique = ''.obs;
//   var driverName = ''.obs;
//   var driverStatus = ''.obs;
//   var details = [].obs;
//   var datacaradd;
//   var profiledetails;
//   var forgot_id = ''.obs;
//   var makePhoneCall;
//   var driveruniqueId = ''.obs;
//   var driveruniqueId1 = ''.obs;
//   var driveruniqueId2 = ''.obs;
//   var driveruniqueId3 = ''.obs;
//   var driveruniqueId4 = ''.obs;
//   var storage = GetStorage();
//   //register
//   final TextEditingController nameCon = TextEditingController();
//   final TextEditingController mailCon = TextEditingController();
//   final TextEditingController firstNameCon = TextEditingController();
//   final TextEditingController lastNameCon = TextEditingController();
//   final TextEditingController mobileCon = TextEditingController();
//   final TextEditingController emailCon = TextEditingController();
//   final TextEditingController VehicleNumCon = TextEditingController();
//   final TextEditingController passCon = TextEditingController();
//   final TextEditingController Instructions = TextEditingController();
//   final TextEditingController carnumber = TextEditingController();
//   final TextEditingController name = TextEditingController();
//   final TextEditingController districtcon = TextEditingController();
//   final TextEditingController statecon = TextEditingController();
//   final TextEditingController ReferralIDcon = TextEditingController();
//   final TextEditingController addresscon = TextEditingController();
//   final TextEditingController DateController = TextEditingController();
//   final TextEditingController DatetoController = TextEditingController();

//   final TextEditingController confirmPasswordCon = TextEditingController();
//   TextEditingController upload2 = TextEditingController();
//   TextEditingController upload3 = TextEditingController();
//   TextEditingController upload4 = TextEditingController();
//   var selectGender = "Male".obs;

//   //token
//   String? token;

//   //ll
 
//   bool? isLoaded;
//   var lat;
//   var lon;
//   var timeNotifier = ''.obs;

//   //background
//   //var task ='firstTask';
//   //otp
//   final TextEditingController otpCon = TextEditingController();

//   //change password
//   final TextEditingController oldPassCon = TextEditingController();
//   final TextEditingController newPassCon = TextEditingController();
//   final TextEditingController confirmPassCon = TextEditingController();

//   void loginapi() async {
//     showLoading();
//     var body = jsonEncode({
//       'api_key': API().gapikey,
//       'phone': mobileCon.text,
//     });
//     var response =
//         await BaseClient().post(API().logIn, body).catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     print(json.decode(response));

//     hideLoading();
//     if (data['Status']) {
//         // Get.off(OTPView(number: mobileCon.text,));
       
//       InitCon acon = InitCon();
//       otp.value = data["otp"].toString();
//       print('object' + otp.toString());
//        mobileCon.clear();
//       Fluttertoast.showToast(msg:otp.value);
      
//       // currentIndex = 0;
//       // Get.offAll(BottomNav());
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   void loginOtpApi(String mobno) async {
//     showLoading();
//     var body = jsonEncode({
//       'api_key': API().gapikey,
//       'phone': mobno,
//       'otp' : otpCon.text,
//       'token' : token.toString(),
//     });
//     var response =
//         await BaseClient().post(API().loginotp, body).catchError(handleError);
//    // if (response == null) return;
//    //print(response.statusCode);
//     var data = json.decode(response);
//     print('ptp' + data.toString());

//     hideLoading();
//     if (data['status'] == true) {
//        details.value = data['driver_detail'];
//        storage.write('driverId',  details.value[0]['driver_id'].toString());
//        storage.write('driverIdUnique',  details.value[0]['driver_unique_id'].toString());
//        print("id"+ details.value[0]['driver_id'].toString());
//        //driverid.value = details.value[0]['driver_id'].toString();
//        //driverUnique.value = details.value[0]['driver_unique_id'].toString();
//        driverName.value = details.value[0]['driver_name'].toString();
//        driverStatus.value = details.value[0]['driver_status'].toString();
//       print('driv' + driverid.value.toString());
//      // Get.off(ChoosePickup());
//       //InitCon acon = InitCon();
//       otpCon.clear();
    
         
//     } else {
//       Fluttertoast.showToast(msg: data['message']); 
//     }
//   }


//   void vehicleRC() async {
//   showLoading();
//     final uri = Uri.parse(API().baseURL + 'profile');
//     var request = http.MultipartRequest('POST', uri);
//     request.headers.addAll(
//       {
//         "Content-Type": "application/json",
//         // 'X-API-KEY': baseToken
//       },
//     );
//     request.fields['api_key'] = API().gapikey;
//     request.fields['driver_unique_id'] = driveruniqueId.value;
//     request.fields['color'] = ReferralIDcon.text;

//    if (upload2.text.isNotEmpty) {
//       var firstimage =
//           await http.MultipartFile.fromPath('image', upload2.text);
//       request.files.add(firstimage);
//     }

//     if (upload3.text.isNotEmpty) {
//       var firstimage2 =
//           await http.MultipartFile.fromPath('imagerc', upload3.text);
//       request.files.add(firstimage2);
//     }

//      if (upload4.text.isNotEmpty) {
//       var firstimage3 =
//           await http.MultipartFile.fromPath('imagercback', upload4.text);
//       request.files.add(firstimage3);
//     }

//     var response = await request.send();
//     final respStr = await response.stream.bytesToString();
//     var data = json.decode(respStr);
//     print('hello' + data.toString());
//     if (data['Status'] == true) {
//       hideLoading();
//       driveruniqueId1.value = data['driver_unique_id'].toString();
//       Fluttertoast.showToast(msg: data['message']);
//   //     Get.off(drivinglicenseview());
       
//        ReferralIDcon.clear();
//        upload2.clear();
//        upload3.clear();
//        upload4.clear();

      
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }


//   void drivingLicense() async {
//   showLoading();
//     final uri = Uri.parse(API().baseURL + 'dl');
//     var request = http.MultipartRequest('POST', uri);
//     request.headers.addAll(
//       {
//         "Content-Type": "application/json",
//         // 'X-API-KEY': baseToken
//       },
//     );
//     request.fields['api_key'] = API().gapikey;
//     request.fields['driver_unique_id'] = driveruniqueId1.value;
//     request.fields['dl_number'] = ReferralIDcon.text;
//     request.fields['expiry_date'] = DateController.text;


//    if (upload2.text.isNotEmpty) {
//       var firstimage =
//           await http.MultipartFile.fromPath('dl_front', upload2.text);
//       request.files.add(firstimage);
//     }

//     if (upload3.text.isNotEmpty) {
//       var firstimage2 =
//           await http.MultipartFile.fromPath('dl_back', upload3.text);
//       request.files.add(firstimage2);
//     }

    
//     var response = await request.send();
//     final respStr = await response.stream.bytesToString();
//     var data = json.decode(respStr);
//     print('hello' + data.toString());
//     if (data['Status'] == true) {
//        hideLoading();
//       driveruniqueId2.value = data['driver_unique_id'].toString();
//       Fluttertoast.showToast(msg: data['message']);
//      // Get.off(()=> aadherview());
//       ReferralIDcon.clear();
//       DateController.clear();
//       upload2.clear();
//       upload3.clear();
     
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }


//    void adhar() async {
//    showLoading();
//     final uri = Uri.parse(API().baseURL + 'adhar');
//     var request = http.MultipartRequest('POST', uri);
//     request.headers.addAll(
//       {
//         "Content-Type": "application/json",
//         // 'X-API-KEY': baseToken
//       },
//     );
//     request.fields['api_key'] = API().gapikey;
//     request.fields['driver_unique_id'] = driveruniqueId2.value;
//     request.fields['adhar_number'] = ReferralIDcon.text;
    

//    if (upload2.text.isNotEmpty) {
//       var firstimage =
//           await http.MultipartFile.fromPath('adhar_front', upload2.text);
//       request.files.add(firstimage);
//     }

//     if (upload3.text.isNotEmpty) {
//       var firstimage2 =
//           await http.MultipartFile.fromPath('adhar_back', upload3.text);
//       request.files.add(firstimage2);
//     }


//     var response = await request.send();
//     final respStr = await response.stream.bytesToString();
//     var data = json.decode(respStr);
//     print('hello' + data.toString());
//     if (data['Status'] == true) {
//        hideLoading();
//       driveruniqueId3.value = data['driver_unique_id'].toString();
//       Fluttertoast.showToast(msg: data['message']);
//      // Get.off(pancardview());
//        ReferralIDcon.clear();
//        upload2.clear();
//        upload3.clear();
      
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//     void pan() async {
//     showLoading();
//     final uri = Uri.parse(API().baseURL + 'pan');
//     var request = http.MultipartRequest('POST', uri);
//     request.headers.addAll(
//       {
//         "Content-Type": "application/json",
//         // 'X-API-KEY': baseToken
//       },
//     );
//     request.fields['api_key'] = API().gapikey;
//     request.fields['driver_unique_id'] = driveruniqueId3.value;
//     request.fields['pan_number'] = ReferralIDcon.text;


//    if (upload2.text.isNotEmpty) {
//       var firstimage =
//           await http.MultipartFile.fromPath('pan_card', upload2.text);
//       request.files.add(firstimage);
//     }

   
//     var response = await request.send();
//     final respStr = await response.stream.bytesToString();
//     var data = json.decode(respStr);
//     print('hello' + data.toString());
//     if (data['Status'] == true) {
//       hideLoading();
//       driveruniqueId4.value = data['driver_unique_id'].toString();
//       Fluttertoast.showToast(msg: data['message']);
//     //   Get.off(loginpage());
//        ReferralIDcon.clear();
//        upload2.clear();
       
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   forgotOtp() async {
//     showLoading();
//     var body = {
//       'customer_username': userNameCon.text,
//     };
//     var response =
//         await BaseClient().post(API().forgotOTP, body).catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);

//     hideLoading();
//     if (data['status']) {
//       otpCon.clear();
//       otp.value = data['data']['OTP'].toString();
//       forgot_id.value = data['data']['customer_id'].toString();
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   sendRegisterOtp() async {
//     otp = ''.obs;
//     var body = {
//       'customer_name': nameCon.text,
//       'customer_mobile': mobileCon.text,
//       'customer_password': passCon.text,
//       'customer_email': mailCon.text,
//       'customer_location': lastNameCon.text,
//     };
//     var response =
//         await BaseClient().post(API().register, body).catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     if (data['status']) {
//       otpCon.clear();
//       otp.value = data['data']['OTP'].toString();
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   void register(String firstname, String lastname, String mobile, String email, String vechileNumber, String address, String state, String district, String refId) async {
//     showLoading();
//     var body = jsonEncode({
//     "api_key": API().gapikey,
//     "f_name": firstname,
//     "l_name": lastname,
//     "mobile": mobile,
//     "email": email,
//     "registration_number": vechileNumber,
//     "address": address,
//     "state": state,
//     "district": district,
//     "ref_id": refId,

// });
//     var response = await BaseClient()
//         .post(API().register, body)
//         .catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     hideLoading();
//     if (data['Status']) {
//       driveruniqueId.value = data['driver_unique_id'].toString();
//       print('uniq' + driveruniqueId.value);
//       firstNameCon.clear();
//       lastNameCon.clear();
//       mobileCon.clear();
//       emailCon.clear(); 
//       VehicleNumCon.clear(); 
//       addresscon.clear(); 
//       districtcon.clear(); 
//       statecon.clear(); 
//       ReferralIDcon.clear();
//       Fluttertoast.showToast(msg: data['message']);
//     //   Get.off(vehicleRcview());
//      // Get.offAll(LoginView());
//     } else {
//       Fluttertoast.showToast(msg: 'Something went wrong');
//     }
//   }

  

// }