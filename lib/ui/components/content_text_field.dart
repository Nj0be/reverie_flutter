import 'package:flutter/material.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

class ContentTextField extends StatefulWidget {
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
  State<ContentTextField> createState() => _ContentTextFieldState();
}

class _ContentTextFieldState extends State<ContentTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(ContentTextField oldWidget) {
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
        controller: _controller,
        onChanged: widget.onNewValue,
        maxLines: null, // multiple lines
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

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
