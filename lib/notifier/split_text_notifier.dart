import 'package:flutter/material.dart';

class TextSplitter {
  List<String> splitText({
    required String text,
    required TextStyle textStyle,
    required Size pageSize,
  }) {
    final List<String> pageTexts = [];
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: pageSize.width);
    final lines = textPainter.computeLineMetrics();

    double currentPageBottom = pageSize.height;
    int start = 0, end = 0;

    for (final line in lines) {
      final top = line.baseline - line.ascent;
      final bottom = line.baseline + line.descent;

      if (currentPageBottom < bottom) {
        end = textPainter.getPositionForOffset(Offset(line.left, top)).offset;
        final pageText = text.substring(start, end);
        pageTexts.add(pageText);
        start = end;
        currentPageBottom = top + pageSize.height;
      }
    }

    pageTexts.add(text.substring(start));
    return pageTexts;
  }
}
