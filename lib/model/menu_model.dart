import 'package:rive_animation/utils/rive_utils.dart';

import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<RiveAsset> sidebarMenus = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];

List<RiveAsset> sidebarMenus2 = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
];
