import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller;

  const CustomTextForm({
    super.key,
    required this.hintText,
    this.validator,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 20,
          fontFamily: "SpaceMono",
          fontWeight: FontWeight.bold,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 20,
          fontFamily: "SpaceMono",
          fontWeight: FontWeight.bold,
        ),
      ),
      validator: validator,
    );
  }
}
