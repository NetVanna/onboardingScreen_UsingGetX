import 'package:flutter/material.dart';

class onboarding_widget extends StatelessWidget {
  const onboarding_widget({
    super.key, required this.image, required this.title, required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}