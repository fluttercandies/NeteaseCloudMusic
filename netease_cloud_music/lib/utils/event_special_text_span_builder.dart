import 'package:extended_text/extended_text.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:netease_cloud_music/widgets/widget_at_text.dart';
import 'package:netease_cloud_music/widgets/widget_topic_text.dart';

class EventSpecialTextSpanBuilder extends SpecialTextSpanBuilder{
  @override
  SpecialText createSpecialText(String flag, {TextStyle textStyle, onTap, int index}) {
    if (flag == null || flag == "") return null;
    if(isStart(flag, TopicText.flag)){
      return TopicText(textStyle, index - (TopicText.flag.length - 1));
    }else if (isStart(flag, AtText.flag)){
      return AtText(textStyle, onTap, start: index - (AtText.flag.length - 1));
    }
    return null;
  }

}