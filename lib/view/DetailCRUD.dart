import 'package:crud/controllers/CRUDControllers.dart';
import 'package:crud/models/CRUDModels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCRUD extends GetView<CRUDController> {
  @override
  Widget build(BuildContext context) {
    final CRUDModels data = Get.arguments as CRUDModels;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(closeOverlays: true);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.judul,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
