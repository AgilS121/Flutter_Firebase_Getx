import 'package:crud/controllers/CRUDControllers.dart';
import 'package:crud/models/CRUDModels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCRUD extends GetView<CRUDController> {
  HomeCRUD() {
    Get.put(CRUDController());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            CRUDModels data = controller.dataList[index];
            return Card(
              child: ListTile(
                onTap: () => _detailData(context, data),
                subtitle: Text(data.judul),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editData(context, data),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteData(context, data),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addData(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addData(BuildContext context) {
    Get.toNamed('/add');
  }

  void _editData(BuildContext context, CRUDModels data) {
    Get.toNamed('/edit', arguments: data);
  }

  void _detailData(BuildContext context, CRUDModels data) {
    Get.toNamed('/detail', arguments: data);
  }

  void _deleteData(BuildContext context, CRUDModels data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Pertanyaan'),
          content: Text('Apakah Anda yakin ingin menghapus pertanyaan ini?'),
          actions: [
            TextButton(
              onPressed: () => Get.back(), // Klik Batal
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteData(data.docId);
                Get.back();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
