
import 'package:flutter/material.dart';

class AppServices {

  static double? lbToKg (String lb) {
    final kg = double.tryParse(lb);

    if (kg == null || kg <=0 ){
      return null;
    } else {
      return kg * 0.453;
    }
  }

  static double? cmToM(String cmData) {
    final cm = double.tryParse(cmData);
    if (cm == null || cm < 0) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Data')));
      return null;
    } else {
      return cm / 100.0;
    }
  }

  // this method converts feet to total inch
  // then converts the inch to meter which is later on returned
  static double? feetInchToM (String feetData, String inchData) {
    final feet = double.tryParse(feetData);
    final inch = double.tryParse(inchData);

    if (feet == null || feet < 0 || inch == null || inch < 0) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Data')));
      return null;
    } else {
      final totalInch = (feet*12)+inch;

      if (totalInch <= 0) {
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Data')));
        return null;
      }

      return totalInch*0.0254;
    }
  }

  // According to the requirements
  static String categoryResult (double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 24.9) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  static Color categoryResultColor (double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 24.9) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }
}