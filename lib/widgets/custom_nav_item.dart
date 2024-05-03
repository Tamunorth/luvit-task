import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

const kDefaultAnimationDuration = Duration(seconds: 1);

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
    required this.icon,
    required this.title,
  });

  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(index);
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(

            // shape: BoxShape.circle,
            ),
        duration: kDefaultAnimationDuration * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon,
                colorFilter: index == selectedIndex
                    ? ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      )
                    : ColorFilter.mode(
                        Theme.of(context).hintColor,
                        BlendMode.srcIn,
                      )),
            Text(
              title,
              style: TextStyle(
                color: index == selectedIndex
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).hintColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
