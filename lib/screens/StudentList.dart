// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementp/contoller/contrller.dart';
import 'editStudent.dart';
import 'studentDetails.dart';

class StudentGrid extends StatelessWidget {
  const StudentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
        builder: (BuildContext context, screenProvider, _) {
      return GridView.count(
        crossAxisCount: 2,
        children: List.generate(screenProvider.allStudentList.length, (index) {
          final data = screenProvider.allStudentList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return StudentProfile(
                    name: data.name,
                    age: data.age,
                    std: data.std,
                    place: data.place,
                    image: data.image);
              }));
            },
            child: Card(
              margin: const EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: FileImage(File(data.image)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      data.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      leading: IconButton(
                        onPressed: () {
                          screenProvider.updateImage(data.image);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return EditStudent(
                                name: data.name,
                                age: data.age,
                                std: data.std,
                                place: data.place,
                                image: data.image,
                                id: data.id!);
                          }));
                        },
                        icon: const Icon(Icons.edit),
                        iconSize: 19,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: const Text('Delete',
                                    style: TextStyle(color: Colors.red)),
                                content: const Text('Confirm ?'),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      await screenProvider
                                          .deleteStudent(data.id!);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Deleted Successfully'),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                      ));
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                        iconSize: 19,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
