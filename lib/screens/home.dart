// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementp/contoller/contrller.dart';

import 'addStudent.dart';
import 'StudentList.dart';
import 'search.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[700],
            title: const Text(
              'Students',
              style: TextStyle(color: Colors.white),
          
          ),
          leading: Icon(Icons.menu,color: Colors.white,),
          ),
          body:  SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SearchWidget(),
                  const Expanded(child: StudentGrid()),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey[700],
            onPressed: () {
               context.read<ScreenProvider>().clearImage();
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return AddStudent();
              }));
            },
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        );
  }
}