import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/base_colors.dart';


class filefolder extends StatefulWidget {
  const filefolder({Key? key}) : super(key: key);

  @override
  State<filefolder> createState() => _filefolderState();
}

class _filefolderState extends State<filefolder> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back_rounded,
              size: 40,
              color: blackColor,)),),
      backgroundColor: greyColor,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                width: 350,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Text('Dowload Files',style: TextStyle(fontSize: 16,color: appColor),),),
                    SizedBox(
                      width: 170,
                    ),
                    Icon(Icons.folder,color: appColor,)

                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                width: 350,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Text('',style: TextStyle(fontSize: 16,color: appColor),),),
                    SizedBox(
                      width: 170,
                    ),
                    Icon(Icons.folder,color: appColor,)

                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),


    );
  }
}
