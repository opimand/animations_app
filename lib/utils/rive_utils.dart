import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachineName = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(controller!);
    return controller;
  }
}

class RiveAsset {
  final String artBoard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artBoard, required this.stateMachineName, required this.title, this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/icons.riv",
      artBoard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artBoard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artBoard: "TIMER", stateMachineName: "TIMER_Interactivity", title: "Timer"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artBoard: "BELL", stateMachineName: "BELL_Interactivity", title: "Notification"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artBoard: "USER", stateMachineName: "USER_Interactivity", title: "Profile"),
];
