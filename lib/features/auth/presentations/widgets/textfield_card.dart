import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldCard extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool isActive;
  final bool? isNotVisible;

  const TextFieldCard({
    Key? key,
    required this.title,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.onChanged,
    this.isActive = false,
    this.isNotVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color: Color(0xFFF2F2F2),
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              hintText: hint,
              hintStyle: TextStyle(
                color: Color(0xFF5B6975),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
