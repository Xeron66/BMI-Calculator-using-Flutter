import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({
    super.key,
    required this.categoryColor,
    required String bmiResult,
    required this.category,
  }) : _bmiResult = bmiResult;

  final Color? categoryColor;
  final String _bmiResult;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: categoryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Text('BMI Result ${_bmiResult}'),
        
            const SizedBox(height: 16,),
        
            if (category != null) Text('Category Result $category'), 
          ],
        ),
      ),
    );
  }
}
