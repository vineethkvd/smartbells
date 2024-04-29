import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

import '../view/homepage/model/alarmmodel.dart';
import '../view/homepage/model/listalarm.dart';


class InitCon extends GetxController with BaseController {
  List<Alarmadd> Alarmadd1=[];
  List<Listalarm> alarm=[];
  List<Listalarm> myalarm=[];
  int myalarmindex=0;
}