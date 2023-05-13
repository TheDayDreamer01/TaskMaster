import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:taskmaster/providers/settings_provider.dart";


class HomeView extends StatelessWidget {
  const HomeView({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final SettingsProvider settingsProvider = 
      Provider.of<SettingsProvider>(context);
      
    return Scaffold(
      body : Center(
        child : Switch(
          value : settingsProvider.getBoolPreference("isLight"),
          onChanged: (value) => settingsProvider.setBoolPreference("isLight", value)
        )
      )
    );
  }
}