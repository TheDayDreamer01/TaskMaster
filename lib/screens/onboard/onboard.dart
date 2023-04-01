import "package:flutter/material.dart";


class OnboardView extends StatelessWidget {

  final List _onboardItem = [
    [
      "Stay on Track with TaskMaster",
      "Stay on track with TaskMaster's checklist feature. Easily create and manage all of your to-dos in one place.",
      "assets/svg/Tutorial1.svg"
    ],
    [
      "Organize Your Life with TaskMaster",
      "Organize your life with TaskMaster. Keep track of all your tasks and projects in one easy-to-use app",
      "assets/svg/Tutorial2.svg"
    ], 
    [
      "Keep Your Data Safe with TaskMaster",
      "TaskMaster's secure storage keeps your data safe, providing peace of mind while managing your tasks and projects.",
      "assets/svg/Tutorial3.svg"
    ] 
  ];

  OnboardView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : SafeArea(
        child: Column(
          children : [
              

          ]
        )
      )
    );
  }
}