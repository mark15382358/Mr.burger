import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_burger/core/theme/themeData.dart';
import 'package:mr_burger/core/utils/pref_helper.dart';
import 'package:mr_burger/core/utils/service_locator.dart';
import 'package:mr_burger/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:mr_burger/main_screen.dart';
import 'package:mr_burger/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator().init();

  String? token = await PrefHelper.getToken();
  print(token);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<HomeCubit>()..getHomeData()),
      ],
      child: MyApp(
        startWidget: token != null ? MainScreen() : const SplashView(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 756.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mr Burger',
          theme: themeData,
          home: startWidget,
        );
      },
    );
  }
}
