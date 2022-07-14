
import 'package:demo/controller/demo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
DemoController controller=Get.put(DemoController());
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
          return CircleAvatar(backgroundImage: NetworkImage(controller.list[index].avatar),);
        },)
      );
      })
     ) );
  }
}
