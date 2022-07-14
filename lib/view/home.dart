import 'package:demo/controller/demo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final Controller controller;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DemoController controller = Get.put(DemoController());
  @override
  void initState() {
    controller.fetchService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Get Storage")),
        body: Obx((() {
          return Center(
              child: ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (() => update()),
                  child: Text(controller.list[index].firstName)
                  
                  );
            },
          ));
        })));
  }
}

update() {
  final box = GetStorage();
  box.write("i", {
    "page": 2,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
      {
        "id": 7,
        "email": "michael.lawson@reqres.in",
        "first_name": "Michael",
        "last_name": "Lawson",
        "avatar": "https://reqres.in/img/faces/7-image.jpg"
      },
      {
        "id": 8,
        "email": "lindsay.ferguson@reqres.in",
        "first_name": "Lindsay",
        "last_name": "Ferguson",
        "avatar": "https://reqres.in/img/faces/8-image.jpg"
      },
      {
        "id": 9,
        "email": "tobias.funke@reqres.in",
        "first_name": "Tobias",
        "last_name": "Funke",
        "avatar": "https://reqres.in/img/faces/9-image.jpg"
      },
      {
        "id": 10,
        "email": "byron.fields@reqres.in",
        "first_name": "Byron",
        "last_name": "Fields",
        "avatar": "https://reqres.in/img/faces/10-image.jpg"
      },
      {
        "id": 11,
        "email": "george.edwards@reqres.in",
        "first_name": "George",
        "last_name": "Edwards",
        "avatar": "https://reqres.in/img/faces/11-image.jpg"
      },
      {
        "id": 12,
        "email": "rachel.howell@reqres.in",
        "first_name": "Rachel",
        "last_name": "Howell",
        "avatar": "https://reqres.in/img/faces/12-image.jpg"
      }
    ],
    "support": {
      "url": "https://reqres.in/#support-heading",
      "text":
          "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
  });
  final i = box.read("j");
  print(i);
}
