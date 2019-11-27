import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';

class TopicText extends SpecialText{
  static const String flag = "#";
  final int start;

  TopicText(TextStyle textStyle, this.start) : super(flag, flag, textStyle);

  @override
  InlineSpan finishText() {
    TextStyle textStyle =
    this.textStyle?.copyWith(color: Colors.blue, fontSize: 16.0);

    final String topicText = toString();

    return SpecialTextSpan(
        text: topicText,
        actualText: topicText,
        start: start,
        style: textStyle,);
  }

}