

import 'dart:io';

import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final String name;
  final String age;
  final String std;
  final String place;
  final String image;

  const StudentProfile(
      {super.key,
      required this.name,
      required this.age,
      required this.std,
      required this.place,
      required this.image});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: ListTile(
          title: Text(name, style: const TextStyle(fontSize: 20,color: Colors.white),),
        ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white)),

      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            ClipOval(
            child:  Image.file(File(image),width: 150,height: 150,fit: BoxFit.cover,),
          ),
            const SizedBox(height: 50,),
            Text(
              'Name : $name',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
           
            Text(
              'Place : $place',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
             Text(
              'Age : $age',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Text(
              'Grade : $std',
              style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}