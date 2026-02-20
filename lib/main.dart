import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_burger/core/theme/themeData.dart';
import 'package:mr_burger/core/utils/service_locator.dart';
import 'package:mr_burger/splash_view.dart';

void main() {
  ServiceLocator().init();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          home: SplashView(),
        );
      },
    );
  }
}
