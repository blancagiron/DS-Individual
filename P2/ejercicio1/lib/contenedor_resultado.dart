import 'package:flutter/material.dart';

class ContenedorResultado extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? borderColor;

  const ContenedorResultado({
    super.key,
    required this.text,
    this.color = const Color(0xFFF2F2F2),
    this.borderColor = const Color(0xFFF9B6E5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor!, width: 2),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}