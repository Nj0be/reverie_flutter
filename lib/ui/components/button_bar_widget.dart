import 'package:flutter/material.dart';
import 'package:reverie_flutter/ui/themes/colors.dart';

class ButtonBarWidget<T> extends StatelessWidget {
  final T buttonState;
  final List<T> buttonElements;
  final ValueChanged<T> onButtonStateUpdate;

  const ButtonBarWidget({
    super.key,
    required this.buttonState,
    required this.buttonElements,
    required this.onButtonStateUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal:16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: buttonElements.map((item) {
          final isSelected = item == buttonState;
          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => onButtonStateUpdate(item),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.secondary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  _displayName(item),
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _displayName(T item) {
    // Check if item has a `name` property (enum in Dart 2.15+)
    // We can do this with `item is Enum` or use a try-catch on `item.name`

    if (item is Enum) {
      return (item as Enum).name.toUpperCase();
    }
    return item.toString().toUpperCase();
  }
}
