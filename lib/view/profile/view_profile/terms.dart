import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../controller/profile_controller.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  ProfileCon pcon = Get.put(ProfileCon());
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await pcon.termFunc();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Txt(
                    text: 'Terms & Conditions',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Txt(
                          text: pcon.termdata?.data.termTitle ?? '',
                          color: RedColor,
                          fsize: 15,
                        )
                      ],
                    ),
                Html(data: pcon.termdata?.data.termDescription??'',)

                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
