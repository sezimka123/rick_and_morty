import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/auth/presentations/screens/sign_up/sign_up_screen.dart';
import 'package:rick_and_morty/features/auth/presentations/widgets/textbutton_card.dart';
import 'package:rick_and_morty/features/auth/presentations/widgets/textfield_card.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 268,
                height: 376,
              ),
            ),
            SizedBox(height: 65.h),
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
            SizedBox(height: 24),
            TextButtonCard(text: "Войти"),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "У вас еще нет аккаунта? ",
                  style: TextStyle(
                    color: Color(0xFF5B6975),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                  },
                  child: Text(
                    "Создать ",
                    style: TextStyle(
                      color: Color(0xFF43D049),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

