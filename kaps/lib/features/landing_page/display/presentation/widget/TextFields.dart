import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Function(String) onItemSelected;
  final String? Function(String?) checkValidity;
  final String hintText;
  final bool obscurity;
  final double x;
  const MyTextField({
    super.key,
    required this.onItemSelected,
    required this.hintText,
    required this.checkValidity,
    required this.obscurity,
    required this.x,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: size.height * 0.06,
        width: size.width * x,
        color: Colors.white,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          obscureText: obscurity,
          onChanged: onItemSelected,
          validator: checkValidity,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}
