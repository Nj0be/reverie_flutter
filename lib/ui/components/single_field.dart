import 'package:flutter/material.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

class SingleLineField extends StatefulWidget {
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
  State<SingleLineField> createState() => _SingleLineFieldState();
}

class _SingleLineFieldState extends State<SingleLineField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(SingleLineField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update if the external value changed
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
        controller: _controller,
        onChanged: widget.onNewValue,
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
          suffixIcon: widget.trailingIcon,
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