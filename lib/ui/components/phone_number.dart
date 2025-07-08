import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/ui/components/error_field.dart';

class PhoneNumberField extends StatelessWidget {
  final String phoneNumber;
  final String errorMessage;
  final ValueChanged<String> onUpdatePhoneNumber;
  final Widget? trailingIcon;

  const PhoneNumberField({
    super.key,
    required this.phoneNumber,
    required this.errorMessage,
    required this.onUpdatePhoneNumber,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhoneNumberInput(
          phoneNumber: phoneNumber,
          onUpdatePhoneNumber: onUpdatePhoneNumber,
          trailingIcon: trailingIcon,
        ),
        if (errorMessage.isNotEmpty) ErrorField(errorMessage: errorMessage),
      ],
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  final String phoneNumber;
  final ValueChanged<String> onUpdatePhoneNumber;
  final Widget? trailingIcon;

  const PhoneNumberInput({
    super.key,
    required this.phoneNumber,
    required this.onUpdatePhoneNumber,
    this.trailingIcon,
  });

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  late TextEditingController _controller;
  PhoneNumber? _initialPhoneNumber;
  final double width = 280;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.phoneNumber);
    _parsePhoneNumber();
  }

  Future<void> _parsePhoneNumber() async {
    try {
      final parsed = await PhoneNumber.getRegionInfoFromPhoneNumber(widget.phoneNumber);
      setState(() {
        _initialPhoneNumber = parsed;
      });
    } catch (e) {
      // fallback: use raw number with default isoCode
      setState(() {
        _initialPhoneNumber = PhoneNumber(isoCode: 'IT', phoneNumber: widget.phoneNumber);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (_initialPhoneNumber == null) {
      return Center(child: CircularProgressIndicator());
    }

    return SizedBox(
        width: width,
        child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          widget.onUpdatePhoneNumber(number.phoneNumber ?? '');
        },
        initialValue: _initialPhoneNumber!,
        textFieldController: _controller,
        formatInput: true,
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
        inputDecoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
              minHeight: 24,
              minWidth: 24
          ),
          suffixIcon: widget.trailingIcon,
          labelText: localizations.phoneNumber,
        ),
      ),
    );
  }
}
