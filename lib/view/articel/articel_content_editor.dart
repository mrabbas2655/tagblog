import 'dart:developer'; // اضافه کردن کتابخانه log

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tecbloc/component/my_component.dart';
import 'package:tecbloc/controller/articel/manage_article_controller.dart';

class ArticelContentEditor extends StatelessWidget {
  ArticelContentEditor({super.key});

  final HtmlEditorController controller = HtmlEditorController();
  final manageArticelController = Get.put(ManageArticelController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appBar("یک مقاله جذاب بنویس"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتونی در اینجا مقالات بنویسی",
                  initialText:
                      manageArticelController.articleInfoModels.value.content ??
                          "", // بررسی مقدار null
                ),
                callbacks: Callbacks(onChangeContent: (content) {
                  manageArticelController.articleInfoModels.update((val) {
                    val?.content = content;
                  });

                  log("محتوای جدید: ${manageArticelController.articleInfoModels.value.content}");
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
