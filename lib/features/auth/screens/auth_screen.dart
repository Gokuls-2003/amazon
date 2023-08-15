import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}
 
class AuthScreen extends StatefulWidget { 
  static const String routeName ="/auth-screen ";

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
 Auth _auth = Auth.signup;
 final _signUpFormKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding
        (padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Welcome" , style: TextStyle(fontSize: 22,
            fontWeight: FontWeight.w500,),),
            ListTile(
          title:  const Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold),),
          leading: Radio(
            activeColor: GobalVariables.secondaryColor,
            value: Auth.signup,
             groupValue: _auth,
             onChanged: (Auth ? val){
              setState(() {
                _auth = val!;
              });
             },
          ), 
        ),
        if(_auth == Auth.signup)
        Form(
          key:  _signUpFormKey,
          child: Column(

          ),
        ),

        ListTile(
          title:  const Text('Sign_in', style: TextStyle(fontWeight: FontWeight.bold),),
          leading: Radio(
            activeColor: GobalVariables.secondaryColor,
            value: Auth.signin,
             groupValue: _auth,
             onChanged: (Auth ? val){
              setState(() {
                _auth = val!;
              });
              
             },
            
           
          )
        ),
        
          ],
        ),),
         
      ),
    );
  }
}