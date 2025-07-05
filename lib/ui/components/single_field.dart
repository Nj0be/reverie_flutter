import 'package:flutter/material.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

class SingleLineField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onNewValue;
  final String label;
  final Widget? trailingIcon;
  final double width;

  const SingleLineField({
    super.key,
    required this.value,
    required this.onNewValue,
    required this.label,
    this.trailingIcon,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // set your desired width here
      child: TextField(
        controller: TextEditingController.fromValue(
          TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          ),
        ),
        onChanged: onNewValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIconConstraints: BoxConstraints(
              minHeight: 24,
              minWidth: 24
          ),
          suffixIcon: trailingIcon,
        ),
        maxLines: 1,
      ),
    );
  }
}

class SingleLineFieldWithError extends StatelessWidget {
  final String value;
  final String errorMessage;
  final ValueChanged<String> onNewValue;
  final String label;
  final Widget? trailingIcon;
  final double width;

  const SingleLineFieldWithError({
    super.key,
    required this.value,
    required this.errorMessage,
    required this.onNewValue,
    required this.label,
    this.trailingIcon,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleLineField(
          value: value,
          onNewValue: onNewValue,
          label: label,
          trailingIcon: trailingIcon,
          width: width,
        ),
        ErrorField(errorMessage: errorMessage),
      ],
    );
  }
}