import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecbloc/component/dimens.dart';
import 'package:tecbloc/component/my_colors.dart';
import 'package:tecbloc/gen/assets.gen.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAndToNamed(MainRoute.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(Assets.images.logo.path, height: Dimens.xlarge),
            SizedBox(
              height: Dimens.large,
            ),
            SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: Dimens.large,
            )
          ]),
        ),
      ),
    );
  }
}
