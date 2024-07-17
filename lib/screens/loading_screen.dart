import 'package:flutter/material.dart';
import 'package:waether_app/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: ktexTColor,
          strokeWidth: 5.5,
          backgroundColor: ktexTColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
