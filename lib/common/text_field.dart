// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import 'base_colors.dart';
// import 'text.dart';

// class CTextField extends StatelessWidget {
//   final String hint, prefix, label, title;
//   final Icon? prefixIcon;
//   final int max;
//   final bool suffixicon;
//   final bool enabled;
//   final TextInputType keyboard;
//   final bool isprefix;
//   final bool ispreicon;
//   final int maxlines;
//   final IconData preicon;
//   final bool ispass;
//   final bool isvisible;
//   final bool istheme;
//   final double padd;
//   final bool obs;
//   final bool islabel;
//   final VoidCallback onTapp;
//   final bool secondDesign;
//   // final int decoration;

//   final VoidCallback passontap;
//   final ValueChanged onchage;
//   final TextEditingController controller;
//   static _defaultFunction() {}
//   static _defaultontap() {}
//   static _onchageFunction(o) {}
//   const CTextField(
//       {Key? key,
//       this.hint = '',
//       this.prefix = '',
//       // this.decoration = false,
//       this.padd = 12,
//       this.maxlines = 1,
//       this.obs = false,
//       this.enabled = true,
//       this.suffixicon = false,
//       this.istheme = false,
//       this.label = '',
//       this.ispass = false,
//       this.isvisible = false,
//       this.title = '',
//       this.passontap = _defaultFunction,
//       this.onchage = _onchageFunction,
//       this.preicon = Icons.person,
//       this.onTapp = _defaultontap,
//       this.ispreicon = false,
//       this.isprefix = false,
//       this.islabel = false,
//       this.max = 500,
//       this.secondDesign = false,
//       this.prefixIcon,
//       required this.controller,
//       this.keyboard = TextInputType.text})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         title != ''
//             ? SizedBox(
//                 height: 4,
//               )
//             : Container(),
//         title != ''
//             ? Txt(
//                 text: title,
//                 fsize: 13,
//                 color: blackColor,
//               )
//             : Container(),
//         title != ''
//             ? SizedBox(
//                 height: 4,
//               )
//             : Container(),
//         TextField(
//           onTap: onTapp,
//           obscureText: obs ? true : false,
//           focusNode: enabled ? FocusNode() : AlwaysDisabledFocusNode(),
//           controller: controller,
//           keyboardType: keyboard,
//           inputFormatters: <TextInputFormatter>[
//             if (max == 10 || max == 6 || max == 3)
//               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//           ],
//           maxLength: max,
//           cursorColor: Get.theme.primaryColor,
//           cursorWidth: 2,
//           onChanged: _onchageFunction,
//           maxLines: maxlines,
//           style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               color: Colors.black87,
//               letterSpacing: .8),
//           decoration: InputDecoration(
//             prefix: Text(
//               prefix,
//               style: TextStyle(
//                   fontSize: 15, color: Colors.black, letterSpacing: .8),
//             ),
//             prefixIcon: prefixIcon,
//             suffixIcon: ispass
//                 ? InkWell(
//                     onTap: passontap,
//                     child: Icon(
//                         !isvisible ? Icons.visibility : Icons.visibility_off),
//                   )
//                 : null,
//             counterText: '',
//             label: Text(
//               hint,
//               style: TextStyle(
//                   fontSize: 10, color: Colors.grey, letterSpacing: .8),
//             ),
//             fillColor: Colors.white,
//             filled: true,
//             floatingLabelBehavior: islabel
//                 ? FloatingLabelBehavior.always
//                 : FloatingLabelBehavior.auto,
//             labelStyle:
//                 TextStyle(fontSize: 10, color: Colors.black, letterSpacing: .8),
//             hintStyle:
//                 TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: .8),
//             hintText: label,
//             focusedBorder: !secondDesign
//                 ? OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide:
//                         BorderSide(color: Get.theme.primaryColor, width: 1.0),
//                   )
//                 : null,
//             enabledBorder: !secondDesign
//                 ? OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                   )
//                 : null,
//             disabledBorder: !secondDesign
//                 ? OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                   )
//                 : null,
//             contentPadding: EdgeInsets.all(padd),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }
