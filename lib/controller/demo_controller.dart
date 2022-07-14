import 'dart:convert';

import 'package:demo/model/demo_model.dart';
import 'package:demo/service/demo_service.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class DemoController extends GetxController {
  static final box = GetStorage();

  @override
  void onInit() {
    fetchbox();
    super.onInit();
  }

  var list = <Datum>[].obs;

  fetchService() async {
    final result = await DemoService.demoService();
    if (result != null) {
      list.value = result.data;
      box.write("i", result.data);
    } else {
      throw Exception(result);
    }
  }

  fetchbox() async {
    final result = box.read("i");

    if (result != null) {
      List data =  result;
      list.value = data.map<Datum>((o) => Datum.fromJson(o)).toList();
    } else {}
  }
}
