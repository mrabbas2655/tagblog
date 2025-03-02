// پیاده‌سازی HttpOverrides برای نادیده گرفتن گواهی‌های SSL نامعتبر
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_localizations/flutter_localizations.dart"
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecbloc/binding.dart';
import 'package:tecbloc/view/articel/manage_articel.dart';
import 'package:tecbloc/view/articel/single.dart';
import 'package:tecbloc/view/articel/single_manage_articel.dart';
import 'package:tecbloc/view/main_screen/main_screen.dart';
import 'package:tecbloc/view/splash_screen.dart';

import 'constant/my_colors.dart';
import 'my_http_overrides.dart';

void main() async {
  // استفاده از MyHttpOverrides برای غیرفعال کردن تأیید گواهی SSL
  HttpOverrides.global = MyHttpOverrides();

  // تنظیمات ظاهری سیستم (مانند رنگ نوار وضعیت)
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor));
  await GetStorage.init();
  // اجرای اپلیکیشن
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(textTheme),
      getPages: [
        GetPage(
            name: MainRoute.routeMainScreen,
            page: () => const MainScreen(),
            binding: RegisterBinding()),
        GetPage(
            name: MainRoute.routeSingleArticle,
            page: () => Single(),
            binding: ArticleBinding()),
        GetPage(
            name: MainRoute.manageArticel,
            page: () => ManageArticel(),
            binding: ArticleManageBinding()),
        GetPage(
            name: MainRoute.singleManageArticel,
            page: () => SingleManageArticel(),
            binding: ArticleManageBinding()),
      ],
      home: const SplashScreen(),
      locale: const Locale('fa', ''),
      supportedLocales: const [
        Locale('fa', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  ThemeData lightTheme(TextTheme textTheme) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black, width: 4),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return textTheme.displayLarge;
              }
              return textTheme.titleMedium;
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return SolidColors.primaryColor;
              }
              return SolidColors.seeMore;
            },
          ),
        ),
      ),
      fontFamily: 'dana',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255)),
        titleMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color.fromARGB(200, 255, 255, 255)),
        bodyLarge: TextStyle(
            fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
        displayMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300),
        displaySmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Color.fromARGB(255, 40, 107, 184),
            fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Color.fromARGB(255, 133, 133, 133),
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class MainRoute {
  static String routeMainScreen = "/MainScreen";
  static String routeSingleArticle = "/SingleArticle";
  static String manageArticel = "/ManageArticel";
  static String singleManageArticel = "/SingleManageArticel";
}
