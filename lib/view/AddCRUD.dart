import 'package:crud/controllers/CRUDControllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCRUD extends GetView<CRUDController> {
  AddCRUD() {
    Get.put(CRUDController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Judul",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextField(
              controller: controller.judulController.value,
              decoration: const InputDecoration(
                hintText: 'Tuliskan  judul',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () => controller.saveData(),
              child: const Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
