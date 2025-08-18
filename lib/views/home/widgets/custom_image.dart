import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.width, required this.height, required this.imageUrl});
  final double width;
  final double height;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/5694129.jpg',
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}