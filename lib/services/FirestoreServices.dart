import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_modify_apuvai/Student_Model/StudentModel.dart';

class FirestoreServices {
  final Firestore _db = Firestore.instance;

  ///Create
  Future<void> createInfo(StudentModel studentModel) {
    return _db
        .collection('Student Management')
        .document(studentModel.studentID)
        .setData(studentModel.toMap());
  }

  ///Read

  Stream<List<StudentModel>> getInfo() {
    return _db.collection('Student Management').snapshots().map((snapshot) =>
        snapshot.documents
            .map((document) => StudentModel.fromFirestore(document.data))
            .toList());
  }

  Future <void> deleteInfo(String StudentId)
  {
    _db.collection('Student Management').document(StudentId).delete();
  }
}
