import 'package:demo/model/demo_model.dart';
import 'package:demo/service/demo_service.dart';
import 'package:get/state_manager.dart';

class DemoController extends GetxController {

  var list=<Datum>[].obs;

  fetchService()async{

    final result =await DemoService.demoService();
    if (result!=null) {
      list.value=result.data;
      
    } else {
      throw Exception(result);
      
    }

  }
  
}