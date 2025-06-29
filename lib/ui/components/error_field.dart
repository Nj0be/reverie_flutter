import 'package:flutter/material.dart';

class ErrorField extends StatelessWidget {
  final String errorMessage;

  const ErrorField({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (errorMessage.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Text(
      errorMessage,
      style: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
      ),
    );
  }
}
