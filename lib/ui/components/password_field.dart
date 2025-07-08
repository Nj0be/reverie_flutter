import 'package:flutter/material.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

class PasswordField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onNewValue;
  final String label;
  final double width;

  const PasswordField({
    super.key,
    required this.value,
    required this.onNewValue,
    this.label = 'Password',
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        obscureText: true, // equivalent of PasswordVisualTransformation()
        controller: TextEditingController.fromValue(
          TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          ),
        ),
        onChanged: onNewValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        maxLines: 1,
      ),
    );
  }
}


class PasswordFieldWithError extends StatelessWidget {
  final String value;
  final String errorMessage;
  final ValueChanged<String> onNewValue;
  final String label;
  final double width;

  const PasswordFieldWithError({
    super.key,
    required this.value,
    required this.errorMessage,
    required this.onNewValue,
    this.label = 'Password',
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PasswordField(
          value: value,
          onNewValue: onNewValue,
          label: label,
          width: width,
        ),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ErrorField(errorMessage: errorMessage),
          ),
      ],
    );
  }
}
