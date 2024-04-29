// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../api_endpoints.dart';
// import 'likers.dart';
// import 'text.dart';

// class FeedTile extends StatefulWidget {
//   final index;
//   FeedTile({Key? key, this.index}) : super(key: key);

//   @override
//   State<FeedTile> createState() => _FeedTileState();
// }

// class _FeedTileState extends State<FeedTile> {
//   final InitCon icon = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//             bottomLeft: Radius.circular(15),
//             bottomRight: Radius.circular(15),
//           ),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Get.theme.primaryColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: ClipOval(
//                     child: Image.network(
//                       widget.index['profile_picture'].toString().length < 5
//                           ? 'https://ui-avatars.com/api/?name=${widget.index['username'].toString()}'
//                           : widget.index['profile_picture'],
//                       height: 25,
//                       width: 25,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               title: Container(
//                 width: Get.width / 1,
//                 child: FittedBox(
//                   child: Row(
//                     children: [
//                       Txt(
//                         text: widget.index['username'].toString(),
//                         fsize: 12,
//                         weight: FontWeight.bold,
//                       ),
//                       Txt(
//                         text: ' Posted In ',
//                         fsize: 10,
//                         weight: FontWeight.normal,
//                       ),
//                       Txt(
//                         text: widget.index['group_name'].toString(),
//                         fsize: 12,
//                         weight: FontWeight.bold,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // subtitle: Txt(
//               //   text: '@',
//               //   fsize: 10,
//               //   color: Colors.grey,
//               // ),
//               trailing:
//                   IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
//             ),
//             Container(
//               height:
//                   widget.index['post_files']['images'].length == 0 ? 0 : 200,
//               child: PageView.builder(
//                   itemCount: widget.index['post_files']['images'].length,
//                   itemBuilder: (context, indexx) {
//                     return Image.network(
//                       API().imgURL +
//                           widget.index['post_files']['images'][indexx]['img'],
//                       height: 200.sp,
//                     );
//                   }),
//             ),
//             if (widget.index['post_detail'] != '')
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Txt(
//                   text: ': ' + widget.index['post_detail'],
//                   lines: 3,
//                   weight: FontWeight.bold,
//                   fsize: 12,
//                 ),
//               ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Txt(
//                 text: '  ' +
//                     widget.index['posted_date'] +
//                     ' | ' +
//                     widget.index['posted_time'],
//                 lines: 2,
//                 fsize: 10,
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(15.sp),
//                     bottomRight: Radius.circular(15.sp),
//                   )),
//               height: 45.sp,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 5.sp,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             icon.getlikes(widget.index['post_id']);
//                             Get.to(() => LikersList());
//                           },
//                           child: widget.index['likes_count'].toString() == '0'
//                               ? SizedBox()
//                               : Txt(
//                                   color: Get.theme.primaryColor,
//                                   text: widget.index['likes_count'].toString(),
//                                   fsize: 12,
//                                 ),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (widget.index['like_status']) {
//                                   widget.index['like_status'] =
//                                       !widget.index['like_status'];
//                                   widget.index['likes_count'] =
//                                       (int.parse(widget.index['likes_count']) -
//                                               1)
//                                           .toString();
//                                 } else {
//                                   widget.index['likes_count'] =
//                                       (int.parse(widget.index['likes_count']) +
//                                               1)
//                                           .toString();
//                                   widget.index['like_status'] =
//                                       !widget.index['like_status'];
//                                 }
//                               });
//                               icon.putlike(widget.index['post_id']);
//                             },
//                             icon: Icon(
//                               widget.index['like_status']
//                                   ? CupertinoIcons.heart_fill
//                                   : CupertinoIcons.heart,
//                               color: Get.theme.primaryColor,
//                             )),
//                         if (widget.index['comments_count'].toString() != '0')
//                           Txt(
//                             color: Get.theme.primaryColor,
//                             text: widget.index['comments_count'].toString(),
//                             fsize: 12,
//                           ),
//                         IconButton(
//                             onPressed: () {
//                               icon.getcomments(widget.index['post_id']);
//                               Get.to(() => CommentsView(
//                                     index: widget.index,
//                                   ));
//                             },
//                             icon: Icon(
//                               Iconsax.message_25,
//                               color: Get.theme.primaryColor,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.send,
//                               color: Get.theme.primaryColor,
//                             )),
//                       ],
//                     ),
//                     // Row(
//                     //   children: [
//                     //     IconButton(
//                     //         onPressed: () {
//                     //           setState(() {
//                     //             widget.index['save_status'] =
//                     //                 !widget.index['save_status'];
//                     //           });
//                     //         },
//                     //         icon: Icon(
//                     //           widget.index['save_status']
//                     //               ? Icons.bookmark
//                     //               : Icons.bookmark_outline,
//                     //           color: Get.theme.primaryColor,
//                     //         ))
//                     //   ],
//                     // )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
