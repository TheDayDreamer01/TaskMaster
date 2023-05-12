import "package:flutter/material.dart";


void main(){
  runApp( const TaskMasterApp() );
}

class TaskMasterApp extends StatelessWidget{
  const TaskMasterApp({ Key ? key }) : super( key : key );

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title : "Task Master",
      debugShowCheckedModeBanner: false,
      home : Scaffold()
    );
  }
}