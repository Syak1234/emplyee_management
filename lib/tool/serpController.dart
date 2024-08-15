import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerpController extends GetxController {
  var title = ''.obs;
  var description = ''.obs;
  var titleCharCount = 0.obs;
  var titlePixelCount = 0.obs;
  var descriptionCharCount = 0.obs;
  var descriptionPixelCount = 0.obs;

  void updateTitle(String text) {
    title.value = text;
    titleCharCount.value = text.length;
    titlePixelCount.value = calculatePixelLength(text);
  }

  void updateDescription(String text) {
    description.value = text;
    descriptionCharCount.value = text.length;
    descriptionPixelCount.value = calculatePixelLength(text);
  }

  int calculatePixelLength(String text) {
    final style = TextStyle(fontSize: 14.0);
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width.round();
  }
}
