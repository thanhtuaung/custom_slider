part of custom_slider;

class SSSlider<T> extends StatelessWidget {
  final List<T> itemList;
  T? initialValue;
  final void Function(T) valueChanged;
  final String Function(T) itemAsString;
  dynamic Function(T) uniqueValue;
  Color? activeColor;
  Color? inActiveColor;
  Color? thumbColor;
  Color? activeTrickMarkColor;
  Color? inActiveTrickMarkColor;
  Color? activeTrackColor;
  Color? inActiveTrackColor;
  double? trickMarkSize;
  final TrickMarkShapes trickMarkShape;

  SSSlider({
    Key? key,
    required this.itemList,
    required this.valueChanged,
    required this.itemAsString,
    required this.uniqueValue,
    TrickMarkShapes? trickMarkShape,
    this.initialValue,
    this.activeColor,
    this.inActiveColor,
    this.thumbColor,
    this.activeTrickMarkColor,
    this.inActiveTrickMarkColor,
    this.inActiveTrackColor,
    this.activeTrackColor,
    this.trickMarkSize,
  })  : trickMarkShape = trickMarkShape ?? TrickMarkShapes.circle,
        super(key: key);

  double sliderWidth = 0;
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatefulBuilder(builder: (context, innerState) {
            return SliderTheme(
              data: SliderThemeData(
                tickMarkShape: getShape(),
                overlayShape: SliderComponentShape.noThumb,
                activeTickMarkColor: activeTrickMarkColor,
                inactiveTickMarkColor: inActiveTrickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inActiveTrackColor,
                thumbColor: thumbColor ?? activeTrackColor,
              ),
              child: Slider(
                value: value,
                divisions: itemList.length - 1,
                min: 0,
                max: itemList.length - 1,
                onChanged: (val) {
                  value = val;
                  valueChanged(itemList[val.round()]);
                  innerState(() {});
                },
              ),
            );
          }),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SliderTheme(
              data: SliderThemeData(
                tickMarkShape: TextShape(
                  textList: itemList.map((e) => itemAsString(e)).toList(),
                ),
                // trackShape: RoundedRectSliderTrackShape(),
                overlayShape: SliderComponentShape.noThumb,
                activeTickMarkColor: Colors.transparent,
                inactiveTickMarkColor: Colors.transparent,
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
                thumbColor: Colors.transparent,
                thumbShape: const RoundSliderThumbShape(
                    disabledThumbRadius: 0,
                    enabledThumbRadius: 0,
                    elevation: 0,
                    pressedElevation: 0),
              ),
              child: Slider(
                value: 0,
                divisions: itemList.length - 1,
                min: 0,
                max: itemList.length - 1,
                onChanged: (val) {
                  // setState(() {});
                },
              ),
            ),
          ),
          Text('Hellooooo'),
        ],
      ),
    );
  }

  SliderTickMarkShape getShape() {
    switch (trickMarkShape) {
      case TrickMarkShapes.circle:
        return RoundSliderTickMarkShape(tickMarkRadius: trickMarkSize);
      case TrickMarkShapes.square:
        return SquareTickMarkShape(side: trickMarkSize);
      case TrickMarkShapes.diamond:
        return DiamondTickMarkShape(side: trickMarkSize);
    }
  }
}
