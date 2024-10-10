import 'package:flutter/services.dart';

class MinMaxValueFormatter extends TextInputFormatter {
  final int minValue;
  final int maxValue;

  MinMaxValueFormatter({required this.minValue, required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    int? newValueParsed = int.tryParse(newValue.text);
    if (newValueParsed != null) {
      if (newValueParsed < minValue || newValueParsed > maxValue) {
        return oldValue;
      }
    }
    return newValue;
  }
}