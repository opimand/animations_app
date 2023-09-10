import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/model/menu_model.dart';
import 'package:rive_animation/screens/home/components/side_menu_tile.dart';
import 'package:rive_animation/utils/rive_utils.dart';

import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sidebarMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(name: "Silici Ilia", profession: "Flutter Developer"),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text("Browse".toUpperCase(),
                    style:
                        Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70)),
              ),
              ...sidebarMenus.map((menu) => SideMenuTile(
                    menu: menu,
                    riveInit: (artboard) {
                      StateMachineController controller = RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    press: () {
                      menu.input!.change(true);
                      setState(() {
                        selectedMenu = menu;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                    },
                    isActive: selectedMenu == menu,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text("History".toUpperCase(),
                    style:
                        Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70)),
              ),
              ...sidebarMenus2.map((menu) => SideMenuTile(
                    menu: menu,
                    riveInit: (artboard) {
                      StateMachineController controller = RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    press: () {
                      menu.input!.change(true);
                      setState(() {
                        selectedMenu = menu;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                    },
                    isActive: selectedMenu == menu,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
