import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:smartbells/view/profile/controller/profile_controller.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  ProfileCon pcon = Get.put(ProfileCon());
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await pcon.privacyFunc();
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
                    text: 'Privacy Policy',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Txt(
                        text: pcon.privacydata?.data.policyTitle ?? '',
                        color: appColor,
                        fsize: 15,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Html(data: pcon.privacydata?.data.policyDescribtion),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
