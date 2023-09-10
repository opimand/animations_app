import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/home/components/animated_bar.dart';
import 'package:rive_animation/screens/home/components/burger_menu.dart';
import 'package:rive_animation/screens/home/components/side_menu.dart';
import 'package:rive_animation/screens/home/home_screen.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClose;
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });

    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));

    scalAnimation = Tween<double>(begin: 1, end: 0.8)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor2,
      body: Stack(
        children: [
          AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 200),
              left: isSideMenuClosed ? -288 : 0,
              width: 288,
              height: MediaQuery.of(context).size.height,
              child: const SideMenu()),
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                  scale: scalAnimation.value,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: HomeScreen(),
                  ),
                ),
              )),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            curve: Curves.fastOutSlowIn,
            child: MenuBurger(
              riveOnInit: (artboard) {
                StateMachineController controller =
                    RiveUtils.getRiveController(artboard, stateMachineName: "State Machine");
                isSideBarClose = controller.findSMI("isOpen");
                isSideBarClose.value = true;
              },
              press: () {
                isSideBarClose.value = !isSideBarClose.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClose.value;
                });
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor2.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                      bottomNavs.length,
                      (index) => GestureDetector(
                            onTap: () {
                              bottomNavs[index].input!.change(true);
                              if (bottomNavs[index] != selectedBottomNav) {
                                setState(() {
                                  selectedBottomNav = bottomNavs[index];
                                });
                              }
                              Future.delayed(const Duration(seconds: 1), () {
                                bottomNavs[index].input!.change(false);
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav),
                                SizedBox(
                                  height: 36,
                                  width: 36,
                                  child: Opacity(
                                    opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                                    child: RiveAnimation.asset(
                                      bottomNavs.first.src,
                                      artboard: bottomNavs[index].artBoard,
                                      onInit: (artboard) {
                                        StateMachineController controller =
                                            RiveUtils.getRiveController(artboard,
                                                stateMachineName:
                                                    bottomNavs[index].stateMachineName);
                                        bottomNavs[index].input =
                                            controller.findSMI("active") as SMIBool;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
