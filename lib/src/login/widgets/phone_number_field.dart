import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        NicNumberFormatter()
      ],
    );
  }
}


class NicNumberFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(oldValue.text.length > newValue.text.length) return newValue;
    final regex = RegExp(r"[0-9]{4}-");
    if (regex.hasMatch(newValue.text)){
      if(newValue.text.length > 9){
        return oldValue;
      }
      return newValue;
    }
    final regex4digit = RegExp(r"[0-9]{4}");
    if(regex4digit.hasMatch(newValue.text)){
      return TextEditingValue(
        text: "${newValue.text}-",
        selection: const TextSelection(baseOffset: 5, extentOffset: 5)
      );
    }
    return newValue;
  }

}