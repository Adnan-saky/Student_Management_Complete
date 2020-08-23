import 'package:crud_modify_apuvai/Student_Model/StudentModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_modify_apuvai/provider/Student_Provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_modify_apuvai/Screens/StudentList.dart';



class HomePage extends StatefulWidget {
  final StudentModel studentModel;

  const HomePage([ this.studentModel]);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = new TextEditingController();
  final idController = new TextEditingController();
  final deptController = new TextEditingController();
  final batchController = new TextEditingController();
  final cgpaController = new TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    deptController.dispose();
    batchController.dispose();
    cgpaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if(widget.studentModel == null)
      {
        nameController.text = "";
        idController.text = "";
        deptController.text = "";
        batchController.text = "";
        cgpaController.text = "";

        new Future.delayed(Duration.zero,()
        {
          final studentProvider = Provider.of<StudentProvider>(context,listen: false);
          studentProvider.loadValues(StudentModel());
        });
      }
    else{
      nameController.text = widget.studentModel.studentName;
      idController.text = widget.studentModel.studentID;
      deptController.text = widget.studentModel.studentDepartment;
      batchController.text = widget.studentModel.studentBatch;
      cgpaController.text = widget.studentModel.currentCgpa;

      new Future.delayed(Duration.zero,()
      {
        final studentProvider = Provider.of<StudentProvider>(context,listen: false);
        studentProvider.loadValues(widget.studentModel);
      });

    }


    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    print(widget.studentModel);
    return Scaffold(
      appBar: AppBar(
        title:
        (widget.studentModel == null)?
        Text('Student Dashboard'):
        Text('Update'),

      ),
      body:
         Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller : nameController,
                        decoration: InputDecoration(
                          labelText: 'Student Name',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        onChanged: (value){
                          studentProvider.changeName(value);
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller : idController,
                        decoration: InputDecoration(
                            labelText: 'Student ID',
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),),
                        onChanged: (value){
                            studentProvider.changeId(value);
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller : deptController,
                        decoration: InputDecoration(
                            labelText: 'Department',
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),),
                        onChanged: (value){
                          studentProvider.changeDepartment(value);
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller : batchController,
                        decoration: InputDecoration(
                            labelText: 'Batch',
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),),
                        onChanged: (value){
                          studentProvider.changeBatch(value);
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller : cgpaController,
                        decoration: InputDecoration(
                            labelText: 'Current CGPA',
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),),
                        onChanged: (value){
                          studentProvider.changeCgpa(value);
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            spacing: 5.0,
                            children: <Widget>[
                              (widget.studentModel == null)?
                              RaisedButton(
                                child: Text('Create'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.green,
                                onPressed: () {
                                  studentProvider.createInfo();
                                  print('Your Info created');
                                },
                              ):Container(),
                              (widget.studentModel == null)?
                              RaisedButton(
                                child: Text('Read'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentList()));
                                },
                              ):Container(),
                              (widget.studentModel != null)?
                              RaisedButton(
                                child: Text('Update'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.orange,
                                onPressed: () {
                                  studentProvider.createInfo();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentList()));
                                },
                              ):Container(),
                              (widget.studentModel != null)?
                              RaisedButton(
                                child: Text('Delete'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.red,
                                onPressed: () {
                                  studentProvider.deleteStudent(widget.studentModel.studentID);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentList()));
                                },
                              ):Container(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
