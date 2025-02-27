import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecbloc/constant//my_strings.dart';
import 'package:tecbloc/gen/assets.gen.dart';

import '../component/dimens.dart';
import '../component/my_component.dart';
import '../constant//my_colors.dart';
import '../models/fake_data.dart';
import 'main_screen/main_screen.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimens.bodyMargin, right: Dimens.bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  SvgPicture.asset(
                    Assets.images.tcbot.path,
                    height: 100,
                  ),
                  SizedBox(height: 32),
                  Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.headlineMedium,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    MyStrings.chooseCats,
                    style: textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.3,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains(tagList[index])) {
                                  selectedTags.add(tagList[index]);
                                } else {
                                  debugPrint("${tagList[index]}}exist");
                                }
                              });
                            },
                            child: MainTags(
                              textTheme: textTheme,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Image.asset(
                    Assets.icons.downCatArrow.path,
                    scale: 2,
                  ),
                  //selected Tags
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.3,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  color: SolidColors.surface),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedTags[index].title,
                                      style: textTheme.headlineMedium,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedTags.removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainScreen()));
                      },
                      child: Text(
                        "بریم",
                        style: textTheme.displayMedium,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
