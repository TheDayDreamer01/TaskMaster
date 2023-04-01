import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:provider/provider.dart";



import "package:taskmaster/const/light_theme_const.dart";
import "package:taskmaster/const/dark_theme_const.dart";


import "package:taskmaster/screens/auth/auth.dart";
import "package:taskmaster/screens/onboard/onboard.dart";


import "package:taskmaster/providers/settings_provider.dart";


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers : [
        ChangeNotifierProvider(
          create : (context) => SettingsProvider()
        ),
        
      ],
      child : const TaskMasterApp()
    )
  );
}


class TaskMasterApp extends StatelessWidget {
  const TaskMasterApp({ super.key });

  @override
  Widget build(BuildContext context){
    
    final wSettings = context.watch<SettingsProvider>();
    final isFirstInstall = wSettings.getBoolPreference("isFirstInstall");
    final isDarkMode = wSettings.getBoolPreference("isDarkMode");
    
    return MaterialApp(
      title : "TaskMaster",
      debugShowCheckedModeBanner: false,

      theme : lightTheme,
      darkTheme: darkTheme,
      themeMode : (!isDarkMode) ?
        ThemeMode.light :
        ThemeMode.dark,

      home : (isFirstInstall) ? 
        OnboardView() :
        const AuthView()
    );
  }
}