import 'package:crud/controllers/CRUDControllers.dart';
import 'package:crud/models/CRUDModels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCRUD extends GetView<CRUDController> {
  @override
  Widget build(BuildContext context) {
    final CRUDModels data = Get.arguments as CRUDModels;

    controller.judulController.value.text = data.judul;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("judul",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            TextField(
              controller: controller.judulController.value,
              decoration: InputDecoration(
                hintText: 'Tuliskan  judul',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () => controller.updateData(
                  data.docId,
                  CRUDModels(
                    docId: data.docId,
                    judul: controller.judulController.value.text.trim(),
                  )),
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }

  EditCRUD() {
    Get.put(CRUDController());
  }
}
