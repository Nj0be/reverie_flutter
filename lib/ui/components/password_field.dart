import 'package:flutter/material.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

class PasswordField extends StatefulWidget {
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
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(PasswordField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value &&
        widget.value != _controller.text) {
      _controller.text = widget.value;
      _controller.selection = TextSelection.collapsed(offset: widget.value.length);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        obscureText: true,
        controller: _controller,
        onChanged: widget.onNewValue,
        decoration: InputDecoration(
          labelText: widget.label,
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
