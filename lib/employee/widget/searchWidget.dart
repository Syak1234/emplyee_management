import 'package:employee_management/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ColorPage.elevation,
      child: Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.sizeOf(context).width - 1000,
        // decoration: BoxDecoration(boxShadow: ),
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: ColorPage.white,
            filled: true,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.zero),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.zero),
            labelText: 'Search',
          ),
        ),
      ),
    );
  }
}
