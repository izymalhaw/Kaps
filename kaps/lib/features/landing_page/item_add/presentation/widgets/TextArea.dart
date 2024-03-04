import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final Function(String) onItemSelected;
  final String? Function(String?) checkValidity;
  final String hintText;
  final bool obscurity;

  final IconData icons;
  const TextArea({
    super.key,
    required this.onItemSelected,
    required this.hintText,
    required this.icons,
    required this.checkValidity,
    required this.obscurity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
        textInputAction: TextInputAction.next,
        obscureText: obscurity,
        onChanged: onItemSelected,
        validator: checkValidity,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Icon(
            icons,
            color: Colors.grey,
          ),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
