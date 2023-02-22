part of custom_slider;

class SquareTickMarkShape extends SliderTickMarkShape {
  /// Side should less than 20
  final double? side;

  SquareTickMarkShape({
    this.side,
  });

  @override
  Size getPreferredSize({required SliderThemeData sliderTheme, required bool isEnabled}) {
    return Size.square(side ?? sliderTheme.trackHeight! * 1.5);
  }

  @override
  void paint(PaintingContext context, Offset center, {required RenderBox parentBox, required SliderThemeData sliderTheme, required Animation<double> enableAnimation, required Offset thumbCenter, required bool isEnabled, required TextDirection textDirection}) {
    Color? begin;
    Color? end;
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

    // The tick marks are tiny circles that are the same height as the track.
    final double tickMarkRadius = getPreferredSize(
      isEnabled: isEnabled,
      sliderTheme: sliderTheme,
    ).width / 2;
    if (tickMarkRadius > 0) {
      context.canvas.drawRect(Offset((center.dx - (tickMarkRadius) / 2), (center.dy - (tickMarkRadius * 3) / 2)) & Size(tickMarkRadius, tickMarkRadius * 3), paint);
    }
  }

}