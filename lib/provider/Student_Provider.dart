import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:crud_modify_apuvai/Student_Model/StudentModel.dart";
import "package:crud_modify_apuvai/services/FirestoreServices.dart";
import 'package:uuid/uuid.dart';

class StudentProvider with ChangeNotifier {
  final firestoreService = FirestoreServices();

  String _name;
  String _id;
  String _department;
  String _batch;
  String _cgpa;

  //Getter

  String get name => _name;
  String get id => _id;
  String get department => _department;
  String get batch => _batch;
  String get cgpa => _cgpa;

  //Setter
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeId(String value) {
    _id = value;
    notifyListeners();
  }

  changeDepartment(String value) {
    _department = value;
    notifyListeners();
  }

  changeBatch(String value) {
    _batch = value;
    notifyListeners();
  }

  changeCgpa(String value) {
    _cgpa = value;
    notifyListeners();
  }

  loadValues(StudentModel studentModel) {
    _name = studentModel.studentName;
    _batch = studentModel.studentBatch;
    _cgpa = studentModel.currentCgpa;
    _id = studentModel.studentID;
    _department = studentModel.studentDepartment;
  }

  createInfo() {
    if (_id == null) {
      var NewstudentlData = StudentModel(
          studentName: name,
          studentID: id,
          studentDepartment: department,
          studentBatch: batch,
          currentCgpa: cgpa);
      firestoreService.createInfo(NewstudentlData);
    } else {
      var updateStudent = StudentModel(
          studentName: _name,
          studentID: _id,
          studentDepartment: _department,
          studentBatch: _batch,
          currentCgpa: _cgpa);
      firestoreService.createInfo(updateStudent);
    }
  }

  deleteStudent(String StudentId) {
    firestoreService.deleteInfo(StudentId);
  }
}

/*readAllData(){
     StreamBuilder(
         stream: Firestore.instance.collection('Student Management').snapshots(),
         builder: (context,snapshot){
           return ListView(
             children:viewListItem(snapshot);
           );
         });

     List<Widget> viewListItem(AsyncSnapshot snapshot){
       return snapshot.data.documents.map((documents){
         return Text('Data');
       }).toList();
     }
  }*/
