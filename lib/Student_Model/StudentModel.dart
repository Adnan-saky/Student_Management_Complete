class StudentModel {
  final String studentName;
  final String studentID;
  final String studentDepartment;
  final String studentBatch;
  final String currentCgpa;

  StudentModel({this.studentName,this.studentID,this.studentDepartment,this.studentBatch,this.currentCgpa});

  Map <String,dynamic> toMap(){
    return {
      'name' : studentName,
      'id' : studentID,
      'department' : studentDepartment,
      'batch' : studentBatch,
      'cgpa' : currentCgpa
    };
  }

  StudentModel.fromFirestore(Map <String,dynamic> firestore):
        studentName = firestore['name'],
  studentID = firestore['id'],
  studentDepartment = firestore['department'],
  studentBatch = firestore['batch'],
  currentCgpa = firestore['cgpa'];

}
