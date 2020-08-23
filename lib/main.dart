import 'package:crud_modify_apuvai/services/FirestoreServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_modify_apuvai/provider/Student_Provider.dart';
import 'Screens/HomePage.dart';
import 'package:crud_modify_apuvai/services/FirestoreServices.dart';
import 'package:crud_modify_apuvai/Student_Model/StudentModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreServices = new FirestoreServices();
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>StudentProvider()),
        StreamProvider(create: (context) => firestoreServices.getInfo(),)
      ],

      child: MaterialApp(
        title: 'Student Management',
        home: HomePage(),
      ),
    );
  }
}
