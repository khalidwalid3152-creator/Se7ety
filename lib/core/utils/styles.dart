import 'package:flutter/widgets.dart';
import 'package:se7ety/core/utils/colors.dart';

class Styles {
 static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ); 
  static const TextStyle titleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.borderColor
    );
  static const TextStyle bodyStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  static const TextStyle subheadingStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor
    );
}