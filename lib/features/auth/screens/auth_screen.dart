import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget { 
  static const String routeName ="/auth-screen ";

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: GobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding
        (padding: EdgeInsets.all(10.5),
        child: Column(
          children: [
            Text("Welcome" , style: TextStyle(fontSize: 22,
            fontWeight: FontWeight.w500,),)
          ],
        ),),
      ),
    );
  }
}