import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';

Flexible buildTextFormField(
    {required TextEditingController controller,
    required String hintText,
    IconData? icon,
    required String? Function(String?)? validator,
    bool isPassword = false,
    int flex = 1}) {
  return Flexible(
    flex: flex,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: ColorPage.decoration1,
        alignment: Alignment.center,
        child: TextFormField(
          controller: controller,
          maxLines: 1,
          // obscureText: isPassword,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorPage.white,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: Color.fromARGB(255, 7, 22, 45)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: Color.fromARGB(255, 7, 22, 45)),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: Color.fromARGB(255, 7, 22, 45)),
            ),
            // prefixIcon: Icon(icon),
            labelText: hintText,
          ),
        ),
      ),
    ),
  );
}
