import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(String docId, Map<String, dynamic> data) async {
    await _firestore.collection('sample').doc(docId).set(data);
  }

  Stream<List<Map<String, dynamic>>> getData() {
    return _firestore.collection('sample').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList());
  }

  Future<void> updateData(String docId, Map<String, dynamic> newData) async {
    await _firestore.collection('sample').doc(docId).update(newData);
    print('Data updated successfully');
  }

  Future<void> deleteData(String docId) async {
    await _firestore.collection('sample').doc(docId).delete();
  }

  String generateDocId() {
    return _firestore.collection('sample').doc().id;
  }
}
