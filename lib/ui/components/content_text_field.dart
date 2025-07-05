import 'package:flutter/material.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

// Basic ContentTextField without error
class ContentTextField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onNewValue;
  final String label;
  final double width;

  const ContentTextField({
    super.key,
    required this.value,
    required this.onNewValue,
    required this.label,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: TextEditingController.fromValue(
          TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          ),
        ),
        onChanged: onNewValue,
        maxLines: null, // multiple lines
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

// ContentTextField with error message that calls the basic ContentTextField
class ContentTextFieldWithError extends StatelessWidget {
  final String value;
  final String errorMessage;
  final ValueChanged<String> onNewValue;
  final String label;
  final double width;

  const ContentTextFieldWithError({
    super.key,
    required this.value,
    required this.errorMessage,
    required this.onNewValue,
    required this.label,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ContentTextField(
          value: value,
          onNewValue: onNewValue,
          label: label,
          width: width,
        ),
        if (errorMessage.isNotEmpty) ErrorField(errorMessage: errorMessage),
      ],
    );
  }
}
