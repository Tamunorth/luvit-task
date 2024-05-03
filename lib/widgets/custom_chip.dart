import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    this.onTap,
    required this.title,
    this.selected = false,
  });

  final VoidCallback? onTap;
  final String title;

  final bool selected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              width: 1,
              color: selected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor),
          color: selected ? const Color(0xff621133) : const Color(0xff1A1A1A),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Theme.of(context).primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
