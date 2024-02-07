import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/all_characters_screen.dart';

class TextButtonCard extends StatelessWidget {
  final String text;

  const TextButtonCard({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 319.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF22A2BD),
        ),
        onPressed: () {},
        // onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AllCharacterScreen()));},
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
