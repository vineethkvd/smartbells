// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'appbar.dart';

// class LikersList extends StatefulWidget {
//   const LikersList({Key? key}) : super(key: key);

//   @override
//   State<LikersList> createState() => _LikersListState();
// }

// class _LikersListState extends State<LikersList> {
//   final InitCon icon = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         carticon: false,
//         title: 'Likes!',
//         backicon: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(8.0.sp),
//         child: Obx(() => ListView.builder(
//             itemCount: icon.likelist.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                   contentPadding: EdgeInsets.all(0),
//                   leading: CircleAvatar(
//                       child: ClipOval(
//                           child: Image.network(
//                     'https://source.unsplash.com/random?sig=0',
//                     height: 30.sp,
//                     width: 30.sp,
//                     fit: BoxFit.cover,
//                   ))),
//                   title: Txt(
//                     text: icon.likelist[index]['username'],
//                     fsize: 11,
//                     weight: FontWeight.bold,
//                   ),
//                   trailing: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.all(8),
//                         primary: Get.theme.primaryColorLight,
//                         shape: StadiumBorder()),
//                     onPressed: () {
//                       setState(() {
//                         icon.likelist[index]['follow_status'] =
//                             !icon.likelist[index]['follow_status'];
//                       });
//                     },
//                     child: Txt(
//                       text: icon.likelist[index]['follow_status']
//                           ? '  Unfollow  '
//                           : '   Follow   ',
//                       defalutsize: true,
//                       color: Colors.white,
//                     ),
//                   ));
//             })),
//       ),
//     );
//   }
// }
