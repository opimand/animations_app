import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuBurger extends StatelessWidget {
  const MenuBurger({
    super.key,
    required this.press,
    required this.riveOnInit,
  });
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 40,
          margin: const EdgeInsets.only(left: 14),
          width: 40,
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 8)],
              shape: BoxShape.circle,
              color: Colors.white),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
