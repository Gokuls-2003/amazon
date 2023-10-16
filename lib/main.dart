import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:amazon/features/auth/service/auth_service.dart';
import 'package:amazon/providers/user_providers.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) =>
    UserProvider())
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { 
  final AuthService authService =     AuthService();
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
        scaffoldBackgroundColor:  GobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GobalVariables.secondaryColor,
        ),
        
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        ),

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings ),
      home: const AuthScreen(),
    );
  }
}
