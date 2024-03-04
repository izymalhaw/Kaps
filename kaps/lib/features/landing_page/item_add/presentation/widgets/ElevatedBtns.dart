import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/authentication/presentation/widgets/constants.dart';

class ElevatedBtns extends StatelessWidget {
  final Color PrimaryColor;
  final Color SecondaryColor;
  final String TextDisplay;
  final Function() Onpressed;
  const ElevatedBtns(
      {super.key,
      required this.PrimaryColor,
      required this.SecondaryColor,
      required this.TextDisplay,
      required this.Onpressed});

  get style => null;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: PrimaryColor,
        shadowColor: SecondaryColor,
      ),
      onPressed: Onpressed,
      child: Text(
        TextDisplay,
        style: GoogleFonts.inter(fontSize: 18, color: AppColors["white"]),
      ),
    );
  }
}
