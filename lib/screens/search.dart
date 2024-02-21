import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementp/contoller/contrller.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
  controller: searchCont,
  onChanged: (value) async {
    await context.read<ScreenProvider>().searchStudent(value);
  },
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0), 
    ),
    labelText: 'Search...',
  ),
),

    );
  }
}