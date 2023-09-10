import 'package:flutter/material.dart' show Color;

class Course {
  final String title, description, iconSrc;
  final Color color;

  Course({
    required this.title,
    this.description = 'Build and animate an iOS app from scratch',
    this.iconSrc = "assets/icons/ios.svg",
    this.color = const Color(0xFF7553F6),
  });
}

final List<Course> courses = [
  Course(
    title: "Flutter Clean Architecture",
    description: "Expert in Clean Architecture for scalable Flutter apps.",
  ),
  Course(
    title: "Animations in Flutter",
    iconSrc: "assets/icons/code.svg",
    description: "Proficient in creating dynamic Flutter animations.",
    color: const Color(0xFF80A4FF),
  ),
];

final List<Course> recentCourses = [
  Course(
      title: "BLoC  Mastery", description: "Skilled in BLoC, Provider, GetX for state management"),
  Course(title: "Effective Testing", description: "Adept at robust Flutter testing practices"),
  Course(
      title: "Building UI",
      color: const Color(0xFF9CC5FF),
      iconSrc: "assets/icons/code.svg",
      description: "Mastery in crafting intuitive Flutter UIs"),
];
