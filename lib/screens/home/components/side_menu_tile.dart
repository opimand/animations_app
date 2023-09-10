import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.isActive,
    required this.riveInit,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveInit;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF6792FF), borderRadius: BorderRadius.circular(10)),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artBoard,
                  onInit: riveInit,
                ),
              ),
              title: Text(
                menu.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
