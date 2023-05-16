import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:taskmaster/consts/dark_theme_const.dart";
import "package:taskmaster/consts/light_theme_const.dart";

import "package:taskmaster/providers/auth_provider.dart";
import "package:taskmaster/providers/settings_provider.dart";
import "package:taskmaster/screens/auth/auth.dart";

import "package:taskmaster/screens/auth/pages/error_page.dart";
import "package:taskmaster/screens/auth/pages/nowifi_page.dart";
import "package:taskmaster/screens/auth/pages/loading_page.dart";


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  );  


  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create : (context) => SettingsProvider()
        ),

        ChangeNotifierProvider(
          create : (context) => AuthProvider()
        ),

      ],
      child : const TaskMasterApp()
    )
  );
}

class TaskMasterApp extends StatelessWidget{
  const TaskMasterApp({ Key ? key }) : super( key : key );

  @override
  Widget build(BuildContext context){

    ScreenUtil.init(
      context, 
      designSize: const Size(411, 823)
    ); 

    return Consumer<SettingsProvider>(
      builder : (context, settingsProvider, child){
    
        return Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            
            return _mainAppBuilder(
              authProvider : authProvider, 
              settingsProvider : settingsProvider
            );
          }
        );
      }
    );
  }

  Widget _mainAppBuilder({
    required AuthProvider authProvider,
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

      home : (settingsProvider.getConnectivityResult) ? 
        const NoWifiPage() :
        _appBuilder( 
          settingsProvider : settingsProvider
        )
    );
  }

  Widget _appBuilder({
    required SettingsProvider settingsProvider,
  }){ 
    return StreamBuilder<ConnectivityResult>(
      stream: settingsProvider.getResult,
      builder: (context, snapshot) {

        if (snapshot.data == ConnectivityResult.none){
          return const NoWifiPage();
        }
        
        else if (snapshot.hasData) {
          return const AuthView();
        }
        
        else if (snapshot.hasError) {
          return const ErrorPage();
        }
        
        else {
          return const LoadingPage();
        }
      }
    );
  }
}

