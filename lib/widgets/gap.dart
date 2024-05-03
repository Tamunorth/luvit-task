import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(this.width, this.height, {super.key});
  const Gap.h(this.height, {super.key, this.width = 0});

  const Gap.w(this.width, {super.key, this.height = 0});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    const designSize = Size(430, 960); //Approximate Design size
    final relativeWidth = screenSize.width * (width / designSize.width);
    final relativeHeight = screenSize.height * (height / designSize.height);

    return SizedBox(
      width: relativeWidth,
      height: relativeHeight,
    );
  }
}
