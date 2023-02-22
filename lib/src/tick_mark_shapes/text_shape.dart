part of custom_slider;

class TextShape extends SliderTickMarkShape {
  /// Side should less than 20
  final List<String> textList;
  Color? textColor;

  TextShape({
    required this.textList,
    this.textColor,
  });
  int i = 0;

  @override
  Size getPreferredSize({required SliderThemeData sliderTheme, required bool isEnabled}) {
    return Size.square(sliderTheme.trackHeight! * 1.5);
  }

  @override
  void paint(PaintingContext context, Offset center, {required RenderBox parentBox, required SliderThemeData sliderTheme, required Animation<double> enableAnimation, required Offset thumbCenter, required bool isEnabled, required TextDirection textDirection}) {
    Color? begin;
    Color? end;

    print(i);
    switch (textDirection) {
      case TextDirection.ltr:
        final bool isTickMarkRightOfThumb = center.dx > thumbCenter.dx;
        begin = isTickMarkRightOfThumb ? sliderTheme.disabledInactiveTickMarkColor : sliderTheme.disabledActiveTickMarkColor;
        end = isTickMarkRightOfThumb ? sliderTheme.inactiveTickMarkColor : sliderTheme.activeTickMarkColor;
        break;
      case TextDirection.rtl:
        final bool isTickMarkLeftOfThumb = center.dx < thumbCenter.dx;
        begin = isTickMarkLeftOfThumb ? sliderTheme.disabledInactiveTickMarkColor : sliderTheme.disabledActiveTickMarkColor;
        end = isTickMarkLeftOfThumb ? sliderTheme.inactiveTickMarkColor : sliderTheme.activeTickMarkColor;
        break;
    }
    final Paint paint = Paint()..color = ColorTween(begin: begin, end: end).evaluate(enableAnimation)!;
    paint.style = PaintingStyle.fill;


    final textStyle = TextStyle(
      color: textColor,
      fontSize: 15,
      overflow: TextOverflow.ellipsis,
    );
    final textSpan = TextSpan(
      text: textList[i],
      style: textStyle,
    );
    final textPainter = TextPainter(
      maxLines: 2,
      text: textSpan,
      textDirection: TextDirection.ltr,

    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 60,
    );

    // The tick marks are tiny circles that are the same height as the track.
    final double tickMarkRadius = getPreferredSize(
      isEnabled: isEnabled,
      sliderTheme: sliderTheme,
    ).width / 2;

    if (tickMarkRadius > 0) {
      final textCenter = Offset(center.dx - (textPainter.width / 2), center.dy - (textPainter.height /2));

      textPainter.paint(context.canvas, textCenter);
      // context.canvas.drawRect(Offset((center.dx - (tickMarkRadius) / 2), (center.dy - (tickMarkRadius * 3) / 2)) & Size(tickMarkRadius, tickMarkRadius * 3), paint);
    }
    i++;
    if(i == textList.length) {
      i = 0;
    }
  }

}