// پیاده‌سازی HttpOverrides برای نادیده گرفتن گواهی‌های SSL نامعتبر
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tecbloc/view/main_screen/main_screen.dart';

import 'component/my_colors.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // اجازه می‌دهیم گواهی‌های نامعتبر را بپذیریم
        return true; // همیشه true باشد تا تمام گواهی‌های SSL نامعتبر را بپذیرد
      };
  }
}

void main() {
  // استفاده از MyHttpOverrides برای غیرفعال کردن تأیید گواهی SSL
  HttpOverrides.global = MyHttpOverrides();

  // تنظیمات ظاهری سیستم (مانند رنگ نوار وضعیت)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor));

  // اجرای اپلیکیشن
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.black, width: 4),
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
        textTheme: TextTheme(
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
      ),
      // home: Single(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
      home: MainScreen(),
      locale: Locale('fa', ''),
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
}
