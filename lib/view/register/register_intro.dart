import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tecbloc/constant/my_strings.dart';
import 'package:tecbloc/gen/assets.gen.dart';
import 'package:validators/validators.dart';

import '../../controller/register_controller.dart';

class RegisterIntro extends StatefulWidget {
  RegisterIntro({super.key});

  @override
  State<RegisterIntro> createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  // RegisterController registerController = Get.put(RegisterController());
  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot.path,
                height: 100,
                width: 100,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcom, style: textTheme.headlineMedium)),
              ElevatedButton(
                onPressed: () {
                  _showModalBottomSheet(context, size, textTheme);
                },
                child: Text(
                  "بزن بریم",
                  style: textTheme.displayLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: TextField(
                        controller:
                            registerController.editingTextEditingController,
                        onChanged: (value) {
                          isEmail(value);
                        },
                        decoration: InputDecoration(
                            hintText: 'a.morsdi1384@gmail.com',
                            hintStyle: textTheme.headlineSmall)),
                  ),
                  //a.morsdi1384@gmail.com
                  ElevatedButton(
                      onPressed: () {
                        registerController.register();
                        Navigator.pop(context);
                        _activateCodeBottomSheet(context, size, textTheme);
                      },
                      child: Text(
                        'بزن بریم',
                        style: textTheme.displayLarge,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                      padding: EdgeInsets.all(24),
                      child: TextField(
                        controller:
                            registerController.activeCodeTextEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // فقط اعداد قبول بشه
                          LengthLimitingTextInputFormatter(
                              6), // حداکثر ۶ رقم وارد بشه
                        ],
                        onChanged: (value) {
                          isUUID(value);
                        },
                        decoration: InputDecoration(
                            hintText: 'کد تایید (6 رقم)',
                            hintStyle: textTheme.headlineSmall),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        registerController.verify();
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) => MyCats()));
                      },
                      child: Text(
                        'بزن بریم',
                        style: textTheme.displayLarge,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
