import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_burger/core/theme/themeData.dart';
import 'package:mr_burger/features/auth/view/sign_up_view.dart';
import 'package:mr_burger/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 756.0),

      builder: (_, child) {
        return MaterialApp(
        
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeData,
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // ),
          home: MainScreen(),
        );
      },
    );
  }
}
