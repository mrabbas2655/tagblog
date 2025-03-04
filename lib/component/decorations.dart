import 'package:flutter/cupertino.dart';

import '../constant/my_colors.dart';

class MyDecorations {
  MyDecorations._();

  static BoxDecoration mainGradient = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    gradient: LinearGradient(
      colors: GradientColors.bottomNav,
    ),
  );
}
