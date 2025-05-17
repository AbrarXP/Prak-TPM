import 'package:flutter/material.dart';
import 'dart:ui';

class ItemCard extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const ItemCard({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shadow di Luar
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1), // Warna bayangan
                blurRadius: 15, // Seberapa blur bayangan
                spreadRadius: 10, // Seberapa luas menyebar
                offset: Offset(0, 5), // Bayangan ke bawah
              ),
            ],
          ),
        ),
        // Isi Card dengan Transparan dan Blur
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255), // Transparan
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 1.5,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
