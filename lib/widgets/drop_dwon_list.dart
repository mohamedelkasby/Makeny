import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({
    super.key,
    required this.items,
    required this.label,
    this.selectedValue,
    required this.onChanged,
  });

  final List<String> items;
  final String label;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  late String? _currentValue;

  @override
  void initState() {
    super.initState();
    // Ensure the initial value is valid
    _currentValue = _validateAndGetInitialValue();
  }

  String? _validateAndGetInitialValue() {
    // If selectedValue is not in items, return null
    if (widget.selectedValue != null &&
        widget.items.contains(widget.selectedValue)) {
      return widget.selectedValue;
    }
    return null;
  }

  String? _validateValue(String? value) {
    if (value == null) {
      return "من فضلك اختر ${widget.label}";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            widget.label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        FormField<String>(
          validator: _validateValue,
          initialValue: _currentValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (formFieldState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: formFieldState.hasError
                          ? theme.colorScheme.error
                          : theme.dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: _currentValue,
                      hint: Text(
                        '-اختر-',
                        style: TextStyle(color: theme.hintColor),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: theme.iconTheme.color,
                      ),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        isDense: true,
                        errorStyle: TextStyle(height: 0),
                      ),
                      items: widget.items.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                        });
                        formFieldState.didChange(value);
                        widget.onChanged(value);
                      },
                    ),
                  ),
                ),
                if (formFieldState.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 12),
                    child: Text(
                      formFieldState.errorText!,
                      style: TextStyle(
                        color: theme.colorScheme.error,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
