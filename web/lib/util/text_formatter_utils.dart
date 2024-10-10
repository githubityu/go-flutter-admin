import 'package:flutter/services.dart';
// Limits input between l and 20
// inputFormatters[RangeInputFormatter(min: 1, max: 20)]
class MinMaxValueFormatter extends TextInputFormatter {
  final int minValue;
  final int maxValue;

  MinMaxValueFormatter({required this.minValue, required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text ==''){
      return newValue;
    }
    final newInt = int.tryParse(newValue.text);
    if(newInt == null && newInt! < minValue){
      return const TextEditingValue( ).copyWith(text: minValue.toString());
    } else {
      return newInt > maxValue ? oldValue : newValue;
    }
  }
}