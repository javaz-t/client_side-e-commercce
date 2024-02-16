import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class DroupDown  extends StatelessWidget {
  String? selectedValue;
  final List<String>iteams;
  final String title;
  final Function(String)onSelected;
  DroupDown ({super.key, required this.iteams, required this.title, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              selectedValue ?? title,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: iteams
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              ///added
              onSelected(value!);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}