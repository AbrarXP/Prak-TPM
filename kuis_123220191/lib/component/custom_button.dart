import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String? title;
  final double? radius;
  final VoidCallback? fungsiKetikaDitekan;
  final Color? warnaText;
  final Color? warnaBackground;
  final Color? warnaBorder;
  final FontWeight? tebalFont;

  const customButton({
    super.key,
    this.title,
    this.radius,
    this.fungsiKetikaDitekan,
    this.warnaText,
    this.warnaBackground,
    this.warnaBorder,
    this.tebalFont,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fungsiKetikaDitekan,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        side: BorderSide(color: warnaBorder ?? Colors.white, width: 1.5), // Warna border
        backgroundColor: warnaBackground ?? const Color.fromARGB(0, 255, 254, 254), // Pastikan tidak menyatu dengan background
      ),
      child: Text(
        title ?? "",
        style: TextStyle(
          color: warnaText ?? Colors.white,
          fontWeight: tebalFont ?? FontWeight.normal 
        ),
      ),
    );

  }
}