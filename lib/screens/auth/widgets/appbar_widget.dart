import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:taskmaster/consts/color_const.dart";


class MyAppBarWidget extends StatelessWidget {

  final void Function() ? appBarBackButton;

  const MyAppBarWidget({ 
    Key ? key,
    this.appBarBackButton
  }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child : Row(
        children : [
          IconButton(
            onPressed: appBarBackButton,
            icon : Icon(
              FeatherIcons.arrowLeft, 
              color : TaskMasterColor.silver[900],
            )
          )
        ]
      )
    );
  }
}