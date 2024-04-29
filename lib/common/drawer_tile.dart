// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'package:share/share.dart';

// import '../controller/auth.dart';
// import 'base_colors.dart';
// import 'text.dart';

// // class DrawerTile extends StatelessWidget {
// //   final VoidCallback onTap;
// //   final String title;
// //   final IconData icon;
// //   const DrawerTile(
// //       {Key? key, required this.onTap, required this.title, required this.icon})

// //       : super(key: key);
// class DrawerWidget extends StatefulWidget {
//   DrawerWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _DrawerWidgetState createState() => _DrawerWidgetState();
// }

// class _DrawerWidgetState extends State<DrawerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final AuthCon acon = Get.put(AuthCon());
//     return Drawer(
//         child: ListView(
//             // padding: EdgeInsets.zero,
//             children: [
//           Container(
//             // height: mHeight / 3.9,
//             child: DrawerHeader(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Image.asset(
//                         'assets/Jiffylogo.png',
//                         scale: 4,
//                       ),
//                     ])
//                   ]),

//               //
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/myprofile.png",
//               height: 30,
//               width: 30,
//             ),
//             title: const Text('My Profile'),
//             onTap: () {
//               Get.to(myprofileview());
//               // Navigator.pop(context);
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-6.png",
//               width: 30,
//             ),
//             title: const Text('Referal ID'),
//             onTap: () {
//            //   Get.to(() => refferalId());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-1.png",
//               width: 30,
//             ),
//             title: const Text('My Settelment'),
//             onTap: () {
//             //  Get.to(() => mySettle());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-7.png",
//               width: 30,
//             ),
//             title: const Text('My Rides'),
//             onTap: () {
//             //  Get.to(() => myRide());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//                     ListTile(
//             leading: Image.asset(
//               "assets/Vector-7.png",
//               width: 30,
//             ),
//             title: const Text('My Completed Rides'),
//             onTap: () {
//             //  Get.to(() => completedRide());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),          ListTile(
//             leading: Image.asset(
//               "assets/Vector-7.png",
//               width: 30,
//             ),
//             title: const Text('My Rejected Rides'),
//             onTap: () {
//             //  Get.to(() => myRejected());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Group1011.png",
//               width: 30,
//             ),
//             title: const Text('My Cancelled Rides'),
//             onTap: () {
//            //   Get.to(() => cancelRide());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-9.png",
//               width: 30,
//             ),
//             title: const Text('My Ratings and Reviews'),
//             onTap: () {
//            //   Get.to(() => rating());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/mypoint.png",
//               width: 30,
//             ),
//             title: const Text('My Points'),
//             onTap: () {
//              // Get.to(mypointsview());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Frame-1.png",
//               width: 30,
//             ),
//             title: const Text('My Income'),
//             onTap: () {
//              // Get.to(Incomeview());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-10.png",
//               width: 30,
//             ),
//             title: const Text('My Earnings'),
//             onTap: () {
//             //  Get.to(MyEarning());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-2.png",
//               width: 30,
//             ),
//             title: const Text('About Us'),
//             onTap: () {
//             //  Get.to(() => aboutUs());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-11.png",
//               width: 30,
//             ),
//             title: const Text('Support'),
//             onTap: () {
//            //   Get.to(() => support());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-3.png",
//               width: 30,
//             ),
//             title: const Text('Privacy Policy'),
//             onTap: () {
//              // Get.to(policy());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-4.png",
//               width: 30,
//             ),
//             title: const Text('Terms & Conditions'),
//             onTap: () {
//           //    Get.to(termsCondition());
//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/share.png",
//               width: 30,
//             ),
//             title: const Text('Share App'),
//             onTap: () {
//             Share.share(
//                                   'check out my website https://example.com');

//             },
//           ),
//           Container(
//             height: mHeight / 300,
//             child: Divider(
//               thickness: 1,
//               color: bgreyColor,
//             ),
//           ),
//           ListTile(
//             leading: Image.asset(
//               "assets/Vector-5.png",
//               width: 30,
//             ),
//             title: const Text('Log Out'),
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (context) =>
//                       StatefulBuilder(builder: (context, setState) {
//                         return AlertDialog(
//                           title: Container(
//                             // width: 130,
//                             decoration: BoxDecoration(
//                                 // border: Border(
//                                 //   bottom: BorderSide(
//                                 //     //                    <--- top side
//                                 //     color: greenn,
//                                 //     width: 1.2,
//                                 //   ),
//                                 // ),
//                                 ),
//                             child: Text(
//                               textAlign: TextAlign.center,
//                               "Are you sure want to Logout ?",
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           actions: [
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 10),
//                               child: Divider(
//                                 height: 0,
//                                 thickness: 1,
//                                 indent: 0,
//                                 endIndent: 0,
//                                 color: blackColor,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: blackColor,
//                                   ),
//                                   child: ElevatedButton(
//                                     // color: Color.fromARGB(255, 2, 228, 119),
//                                     child: const Txt(
//                                       text: 'Cancel',
//                                       color: whiteColor,
//                                     ),
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 30,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: blackColor,
//                                   ),
//                                   child: ElevatedButton(
//                                     child: const Txt(
//                                       text: 'Logout',
//                                       color: whiteColor,
//                                     ),
//                                     onPressed: () async {
//                                       acon.storage.remove('driverId');
//                                       Get.off(()=>SplashView());
                                  
//                                       // SharedPreferences pref =
//                                       //     await SharedPreferences.getInstance();
//                                       // pref.clear();
//                                       // Navigator.of(context)
//                                       //     .pushAndRemoveUntil(
//                                       //         MaterialPageRoute(
//                                       //             builder: (context) =>
//                                       //                 Login()),
//                                       //         (Route<dynamic> route) =>
//                                       //             false);
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         );
//                       }));
//             },
//           ),
//         ]));
//   }
//   // Widget build(BuildContext context) {
//   //   return Material(
//   //     color: Colors.transparent,
//   //     child: InkWell(
//   //       child: ListTile(
//   //         onTap: onTap,
//   //         visualDensity: VisualDensity(horizontal: 0, vertical: -2.5),
//   //         leading: Icon(
//   //           icon,
//   //           color: Get.theme.primaryColor,
//   //         ),
//   //         title: Txt(
//   //           text: title,
//   //           fsize: 13,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
