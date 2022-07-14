import 'package:demo/model/demo_model.dart';
import 'package:http/http.dart' as http;

class DemoService {
  static var client = http.Client();
  static Future<DemoModel?> demoService() async {
    final http.Response response =
        await client.get(Uri.parse("https://reqres.in/api/users?page=2"));


        

    if (response.statusCode == 200 || response.statusCode == 201) {
      return demoModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
