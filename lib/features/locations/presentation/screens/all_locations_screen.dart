import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllLocationsScreen extends StatefulWidget {
  const AllLocationsScreen({super.key});

  @override
  State<AllLocationsScreen> createState() => _AllLocationsScreenState();
}

class _AllLocationsScreenState extends State<AllLocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100).r,
                color: Color(0xFFF2F2F2),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Найти локацию",
                  hintStyle: TextStyle(
                    color: Color(0xFF5B6975),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_alt_outlined),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Всего локаций: 200",
              style: TextStyle(
                color: Color(0xFF828282),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                
              },
              itemCount: 200,
            ),
          ],
        ),
      ),
    );
  }
}
