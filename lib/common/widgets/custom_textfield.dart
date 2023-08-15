import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  final TextEditingController controller; 
  const CustomerTextField({super.key, required this.controller } );
    
  @override 
  Widget build(BuildContext context) {
    return TextFormField(
      controller:  controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38), ),
          enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38), ), 
      ),
    );
  }
}