import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../controller/profile_controller.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  ProfileCon pcon = Get.put(ProfileCon());
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await pcon.aboutFunc();
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
                  padding: const EdgeInsets.only(left: 80),
                  child: Txt(
                    text: 'About Us',
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
                        text: pcon.aboutdata?.data.aboutTitle ?? '',
                        color: appColor,
                        fsize: 15,
                      )
                    ],
                  ),
                  Html(data:
                    pcon.aboutdata?.data.content ?? '',

                  ),
                  Row(
                    children: [
                      Txt(
                        text: 'Our Mission',
                        color: appColor,
                        fsize: 15,
                      )
                    ],
                  ),
                  Text(
                    pcon.aboutdata?.data.ourMission ?? '',
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    children: [
                      Txt(
                        text: 'Our Service',
                        color: appColor,
                        fsize: 15,
                      )
                    ],
                  ),
                  Text(
                    pcon.aboutdata?.data.outService ?? '',
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
