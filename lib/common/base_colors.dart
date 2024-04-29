import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

// ncal
Map<int, Color> color = {
  50: Color.fromRGBO(4, 34, 58, .1),
  100: Color.fromRGBO(4, 34, 58, .2),
  200: Color.fromRGBO(4, 34, 58, .3),
  300: Color.fromRGBO(4, 34, 58, .4),
  400: Color.fromRGBO(4, 34, 58, .5),
  500: Color.fromRGBO(4, 34, 58, .6),
  600: Color.fromRGBO(4, 34, 58, .7),
  700: Color.fromRGBO(4, 34, 58, .8),
  800: Color.fromRGBO(4, 34, 58, .9),
  900: Color.fromRGBO(4, 34, 58, 1),
};

const appColor = Color(0xffFFB30038);

MaterialColor colorCustom = MaterialColor(0xffFFB30038, color);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF000000);
const lightWhiteColor = Color(0xFFE5E5E5);
const darkGreyColor = Color(0xFF524D4D);
const lightGreyColor = Color(0xFFF5F5F5);
const greyColor = Color(0xFFFEBEBEB);
const darkRedColor = Color(0xFFF05623);
const blueColor = Color(0xFF17499F);
const skybuleColor = Color(0xFF3674F2);
const playblue = Color(0xFF4675ED);
const RedColor = Color(0xFFFF0000);
const redcolor = Color(0xFFFF0303);
const bgreyColor = Color(0xFFE4E4E4);
const greenColor = Color(0xFF259343);
const lightgreenblueColor = Color(0xFF3a67a8);
const pinkColor = Color.fromARGB(255, 149, 68, 240);

var size;
double mHeight = 0.0;
double mWidth = 0.0;

final defaultPinTheme = PinTheme(
  width: 56,
  // height: 500,
  textStyle:
      TextStyle(fontSize: 20, color: blackColor, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: blackColor),
    borderRadius: BorderRadius.circular(5),
  ),
);

class AppColors {
  static Color grey_ = Color(0XFFE1DDDD);
  static Color black_ = Color(0XFF111111);

  static Color bordercolor_ = Color(0XFF707070);

  static Color textgrey_ = Color(0XFF676565);
  static Color ttextgrey_ = Color(0XFFE7EAEE);
}

String google_api_key = 'AIzaSyAN2-zXyCndNGXNLRGVSXk2EEkYyCqkM7Y';

double defaultPadding = 16.0;

class gradientclr {
  Decoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Color(0xFFA29D9D), Color(0xFF514F4F)]),
    );
  }
}

// mediaSize(BuildContext context) {
//   size = MediaQuery.of(context).size;
//   height_ = size.height;
//   width_ = size.width;
// }

// var size;
// double height_ = 0;
// double width_ = 0;
