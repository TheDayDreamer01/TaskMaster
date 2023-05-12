import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:taskmaster/consts/dark_theme_const.dart";
import "package:taskmaster/consts/light_theme_const.dart";

import "package:taskmaster/providers/settings_provider.dart";
import "package:taskmaster/screens/home/home.dart";


void main(){

  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create : (context) => SettingsProvider()
        )
      
      ],
      child : const TaskMasterApp()
    )
  );
}

class TaskMasterApp extends StatelessWidget{
  const TaskMasterApp({ Key ? key }) : super( key : key );

  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      designSize : const Size(411, 823),
      builder : (context, child) => child!,
      
      child : Consumer<SettingsProvider>(
        builder : (context, settingsProvider, child){
          return _appBuilder(
            settingsProvider : settingsProvider
          );
        }
      )
    );
  }

  Widget _appBuilder({
    required SettingsProvider settingsProvider
  }){
    return MaterialApp(
      title : "Task Master",
      debugShowCheckedModeBanner: false,

      theme : lightTheme,
      darkTheme: darkTheme,

      themeMode : (settingsProvider.getBoolPreference("isLight")) ?
        ThemeMode.dark :
        ThemeMode.light,  

      home : HomeView(),
    );
  }
}

