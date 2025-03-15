import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Color? warna;
  final bool? sembunyikan;

  const CustomTextfield({
    super.key,
    this.hintText,
    this.controller,
    this.warna,
    this.sembunyikan
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
      obscureText: sembunyikan ?? false,
      decoration: InputDecoration(
        hintText: hintText ?? "HintText",
        hintStyle: TextStyle(color: const Color.fromARGB(43, 255, 255, 255)),
        filled: true,
        fillColor:  warna ?? Color.fromARGB(21, 255, 255, 255),
      ),
    );
  }
}