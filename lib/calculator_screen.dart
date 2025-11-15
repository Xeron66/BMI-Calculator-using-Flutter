import 'package:bmi_calculator/services/app_converter.dart';
import 'package:bmi_calculator/widgets/app_input_field.dart';
import 'package:flutter/material.dart';

// enum set to choose a height type
// and to be able to switch between them
enum HeightType { cm, feetInch }

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  HeightType? _heightType = HeightType.cm;

  // Controllers
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _cm_heightController = TextEditingController();  
  final TextEditingController _feet_heightController = TextEditingController();
  final TextEditingController _inch_heightController = TextEditingController();

  String _bmiResult = '';
  String? category;


  void _calculate() {
    final weight = double.tryParse(_weightController.text.trim());

    if (weight == null || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Data')));
      return null;
    }

    final m = _heightType == HeightType.cm ? AppServices.cmToM(_cm_heightController.text.trim()) : AppServices.feetInchToM(_feet_heightController.text.trim(), _inch_heightController.text.trim());

    if (m == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Data')));
      return;
    }

    final bmi = weight/(m*m);
    final cat = AppServices.categoryResult(bmi);

    setState(() {
      _bmiResult = bmi.toStringAsFixed(2);
      category = cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Weight'),
          AppInputField(
            labelText: 'Enter weight (in Kg)',
            controller: _weightController,
            textInputType: TextInputType.number,
          ),

          const SizedBox(height: 8),
          Text('Select Height Type'),
          SegmentedButton<HeightType>(
            segments: [
              ButtonSegment<HeightType>(
                label: Text('Cm'),
                value: HeightType.cm,
              ),

              ButtonSegment<HeightType>(
                label: Text('Feet Inch'),
                value: HeightType.feetInch,
              ),
            ],
            selected: {_heightType!},
            onSelectionChanged: (value) {
              setState(() {
                _heightType = value.first;
              });
            },
          ),

          const SizedBox(height: 8),

          // Condition to switch between two types of height
          Text('Height'),
          // here ... is spread operator used to add more than
          // one widget in a condition
          if (_heightType == HeightType.cm) ...[
            AppInputField(
              labelText: 'Enter height (in Cm)',
              controller: _cm_heightController,
              textInputType: TextInputType.number,
            ),
          ] else ... [
            Row(
              children: [
                Expanded(
                  child: AppInputField(
                    labelText: 'Height (Feet)',
                    controller: _feet_heightController,
                    textInputType: TextInputType.number,
                  ),
                ),

                const SizedBox(width: 8,),

                Expanded(
                  child: AppInputField(
                    labelText: 'Height (Inch)',
                    controller: _inch_heightController,
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            )
          ],

          const SizedBox(height: 16,),

          ElevatedButton(
            onPressed: _calculate,
            child: Text('Calculate')
          ),

          const SizedBox(height: 16,),

          Text('BMI Result $_bmiResult'),

          const SizedBox(height: 16,),

          if (category != null) Text('Category Result $category'),  

        ],
      ),
    );
  }
}
