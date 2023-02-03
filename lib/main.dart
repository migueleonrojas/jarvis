import 'package:flutter/material.dart';
import 'package:jarvis/providers/jarvis_provider.dart';
import 'package:jarvis/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp( AppState());

class AppState extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JarvisProvider(),lazy: false,)
      ],
      child:const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jarvis',
      initialRoute: 'home',
      routes: {
        'home': (_) => JarvisScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}