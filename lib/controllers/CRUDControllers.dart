import 'dart:ffi';

import 'package:crud/models/CRUDModels.dart';
import 'package:crud/service/CRUDService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CRUDController extends GetxController {
  final CRUDService _firestoreService = CRUDService();
  RxList<CRUDModels> dataList = <CRUDModels>[].obs;
  final judulController = TextEditingController().obs;

  void saveData() async {
    try {
      String judul = judulController.value.text.trim();

      String docId = _firestoreService.generateDocId();

      Map<String, dynamic> data = {
        'docId': docId,
        'judul': judul,
      };

      await _firestoreService.addData(docId, data);

      judulController.value.text = '';

      Get.back();
    } catch (e) {}
  }

  @override
  void dispose() {
    judulController.value.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    get();
  }

  void get() {
    _firestoreService.getData().listen((data) {
      dataList
          .assignAll(data.map((item) => CRUDModels.fromJson(item)).toList());
    });
  }

  void updateData(String docId, CRUDModels newData) async {
    try {
      await _firestoreService.updateData(docId, newData.toJson());
      print('Data updated successfully');
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  void deleteData(String docId) {
    _firestoreService.deleteData(docId);
  }
}
