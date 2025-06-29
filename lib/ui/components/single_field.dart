import 'package:flutter/material.dart';
import 'package:reverie_flutter/ui/components/error_field.dart';

class SingleLineField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onNewValue;
  final String label;

  const SingleLineField({
    super.key,
    required this.value,
    required this.onNewValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      ),
      maxLines: 1,
    );
  }
}

class SingleLineFieldWithError extends StatelessWidget {
  final String value;
  final String errorMessage;
  final ValueChanged<String> onNewValue;
  final String label;

  const SingleLineFieldWithError({
    super.key,
    required this.value,
    required this.errorMessage,
    required this.onNewValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // allinea a sinistra, come tipico nei form
      children: [
        SingleLineField(
          value: value,
          onNewValue: onNewValue,
          label: label,
        ),
        ErrorField(errorMessage: errorMessage),
      ],
    );
  }
}