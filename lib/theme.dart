import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF0F4F8);
  static const Color onColor = Color(0xFF4CAF50);
  static const Color offColor = Color(0xFFF44336);
  static const Color highlight = Color(0xFF9C27B0);
  static const Color primaryText = Color(0xFF000000);
  static const Color secondaryText = Color(0xFF757575);
  static const Color gridLine = Color(0xFFE0E0E0);
}

class AppTextStyles {
  static const TextStyle deviceName = TextStyle(
    fontFamily: 'Arial',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.primaryText,
  );

  static const TextStyle sceneName = TextStyle(
    fontFamily: 'Arial',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.primaryText,
  );

  static const TextStyle secondaryText = TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    color: AppColors.secondaryText,
  );

  static const TextStyle chartLabel = TextStyle(
    fontFamily: 'Arial',
    fontSize: 12,
    color: AppColors.secondaryText,
  );

  static const TextStyle tooltipText = TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    color: Colors.white,
  );
}
