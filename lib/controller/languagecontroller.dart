import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyController extends GetxController {
  var size, height, width;
  var lancode = 'en'.obs;
  var lancountry = 'US'.obs;

  @override
  void onInit() {
    lancode.value = GetStorage().read('lancode').toString() == 'null'
        ? 'en'
        : GetStorage().read('lancode').toString();
    lancountry.value = GetStorage().read('lancountry').toString() == 'null'
        ? 'US'
        : GetStorage().read('lancountry').toString();
    super.onInit();
  }

  setlancode(String code) {
    lancode(code);
    GetStorage().write('lancode', code);
  }

  setlancountry(String countrycode) {
    GetStorage().write('lancountry', countrycode);
    lancountry(countrycode);
  }
}