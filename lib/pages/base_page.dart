import 'package:flutter/material.dart';
import 'package:luvit_task/generated/assets.dart';
import 'package:luvit_task/widgets/custom_nav_item.dart';
import 'package:luvit_task/pages/home_page.dart';

import 'package:svg_flutter/svg.dart';

import '../widgets/gap.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  void _switchNavPage(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const IndexedStack(
        index: 0,
        children: [
          HomePage(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.black,
              // shape: ConvexNotchedRectangle(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SafeArea(
              bottom: true,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomNavItem(
                          icon: Assets.assetsNavHome,
                          index: 0,
                          selectedIndex: _selectedIndex,
                          onTap: _switchNavPage,
                          title: '홈',
                        ),
                        CustomNavItem(
                          icon: Assets.assetsNavLocation,
                          index: 1,
                          selectedIndex: _selectedIndex,
                          onTap: _switchNavPage,
                          title: '스팟',
                        ),
                        const SizedBox(
                          width: 65,
                          height: 65,
                        ),
                        CustomNavItem(
                          icon: Assets.assetsNavChat,
                          index: 3,
                          selectedIndex: _selectedIndex,
                          onTap: _switchNavPage,
                          title: '채팅',
                        ),
                        CustomNavItem(
                          icon: Assets.assetsNavPerson,
                          index: 4,
                          selectedIndex: _selectedIndex,
                          onTap: _switchNavPage,
                          title: '마이',
                        ),
                      ]),
                  Positioned(
                    top: -10,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 62,
                        decoration: BoxDecoration(
                          color: const Color(0xff0E0D0D),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -4,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          // color: Theme.of(context).colorScheme.outline,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 0.8],
                            colors: [
                              Color(0xff101010),
                              Color(0xff2F2F2F),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.assetsNavStar,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
