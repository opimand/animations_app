import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/widgets/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;
  List<int> list = [1, 3, 5, 6];

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  Future<Object?> customSigninDialog(BuildContext context, {required ValueChanged onCLosed}) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign In",
      context: context,
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 620,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Welcome to a vivid realm of digital interactivity! Here, in my showcase, every button isn't just presented - it comes alive.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // TODO: Sign in form
                    SignInForm(),

                    // TODO: Divider
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    // TODO: Socal login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/email_box.svg",
                            height: 64,
                            width: 64,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/apple_box.svg",
                            height: 64,
                            width: 64,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/google_box.svg",
                            height: 64,
                            width: 64,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // TODO: Close button
              ],
            ),
          ),
        ),
      ),
    ).then(onCLosed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: const [
                        Text(
                          "Rive & Flutter",
                          style: TextStyle(
                            fontSize: 62,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "With a unique blend of creativity and technical expertise, I have honed my skills in Flutter to deliver dynamic, user-centric applications that are both visually captivating and functionally seamless. ",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),

                  // TODO: Add the animated Button
                  GestureDetector(
                    onTap: () {
                      // TODO: Start the animation
                      _btnAnimationController.isActive = true;

                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          // TODO: Update dialog status

                          customSigninDialog(context, onCLosed: (_) {});
                        },
                      );
                    },
                    child: SizedBox(
                      height: 64,
                      width: 260,
                      child: Stack(
                        children: [
                          RiveAnimation.asset("assets/RiveAssets/button.riv",
                              controllers: [_btnAnimationController]

                              // TODO: Add Rive Controller
                              ),
                          const Positioned.fill(
                            top: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.arrow_right),
                                SizedBox(width: 8),
                                Text(
                                  "Hire me",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Experience Flutter excellence now. Let's transform your ideas into reality",
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
