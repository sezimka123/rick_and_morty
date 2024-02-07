import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/auth/presentations/screens/sign_in/sign_in_screen.dart';
import 'package:rick_and_morty/features/auth/presentations/widgets/textbutton_card.dart';
import 'package:rick_and_morty/features/auth/presentations/widgets/textfield_card.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controller = TextEditingController();
  late bool isActive;
  late bool isNotVisible;

  @override
  void initState() {
    isActive = false;
    isNotVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 36,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Создать аккаунт',
              style: TextStyle(
                color: Color(0xFF0A1B28),
                fontSize: 34.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40.h),
            TextFieldCard(
              title: "Имя",
              hint: "Имя",
            ),
            SizedBox(height: 10.h),
            TextFieldCard(title: "Фамилия", hint: "Фамилия"),
            SizedBox(height: 10.h),
            TextFieldCard(title: "Отчество", hint: "Отчество"),
            SizedBox(height: 36.h),
            Divider(),
            SizedBox(height: 36.h),
            TextFieldCard(
              title: "Логин",
              hint: "Логин",
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 8.h),
            TextFieldCard(
              title: "Пароль",
              hint: "Пароль",
              isActive: isActive,
              controller: controller,
              obscureText: isNotVisible,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  isActive = true;
                } else {
                  isActive = false;
                }
                setState(() {});
              },
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: isActive == true
                  ? IconButton(
                      onPressed: () {
                        isNotVisible = !isNotVisible;
                        setState(() {});
                      },
                      icon: isNotVisible
                          ? Icon(Icons.remove_red_eye_outlined)
                          : Icon(Icons.visibility_off_outlined))
                  : null,
            ),
            SizedBox(height: 63.h),
            TextButtonCard(text: "Создать"),
          ],
        ),
      ),
    );
  }
}
