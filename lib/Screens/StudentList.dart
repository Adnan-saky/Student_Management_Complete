import 'package:crud_modify_apuvai/Screens/HomePage.dart';
import 'package:crud_modify_apuvai/Student_Model/StudentModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentList = Provider.of<List<StudentModel>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StudentList"
        ),
      ),
      body: (studentList != null)?
      ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context,index) {
            return ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage(studentList[index])));
              },
              contentPadding: EdgeInsets.all(10),
              leading: Icon(Icons.person),
              title: Text(studentList[index].studentName,style: TextStyle(fontSize: 30),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Id : "+studentList[index].studentID ,style: TextStyle(fontSize: 20),),
                  Text("Department : "+studentList[index].studentDepartment,style: TextStyle(fontSize: 20),),
                  Text("Batch : "+studentList[index].studentBatch,style: TextStyle(fontSize: 20),),
                  Text("CGPA : "+studentList[index].currentCgpa,style: TextStyle(fontSize: 20),),
                ],
              ),
            );
    },
    ):Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
