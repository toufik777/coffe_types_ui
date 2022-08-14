import 'package:flutter/material.dart';

class CoffeType extends StatelessWidget {
  final String coffeType;
  final bool isSelected;
  final VoidCallback onTap;
  CoffeType({
    required this.coffeType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          coffeType,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
