import 'package:flutter/material.dart';

class AppDropdownButtonFormField extends StatefulWidget {
  final List<String> items;
  final String value;
  final ValueChanged<String?>? onChanged;

  const AppDropdownButtonFormField({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
  });

  @override
  State<AppDropdownButtonFormField> createState() =>
      _AppDropdownButtonFormFieldState();
}

class _AppDropdownButtonFormFieldState
    extends State<AppDropdownButtonFormField> {
  bool _isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropdownButtonFormField<String>(
          isDense: true,
          value: widget.value,
          onChanged: widget.onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          selectedItemBuilder: (BuildContext context) {
            return widget.items.map((String value) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.value,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList();
          },
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        if (_isDropdownOpened)
          Positioned(
            left: 0,
            top: 60, // Adjust the top position based on your layout
            child: Container(
              width: 200, // Set the width of the dropdown menu
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                children: widget.items.map(
                  (String value) {
                    return ListTile(
                      title: Text(value),
                      onTap: () {
                        setState(() {
                          _isDropdownOpened = false;
                        });

                        widget.onChanged!(value);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),
      ],
    );
  }
}
