import 'package:flutter/material.dart';

class SkillSliderCard extends StatelessWidget {
  final String label;
  final double currentSliderValue;
  final Function onChanged;

  const SkillSliderCard(
      {Key key, this.currentSliderValue, this.onChanged, this.label})
      : super(key: key);

  final double _min = 0.0;
  final double _max = 60.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label.toString().replaceAll('SkillType.', '').toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Container(
                  child: Text('${currentSliderValue.toInt().toString()} mins'),
                )
              ],
            ),
          ),
          Slider(
            value: currentSliderValue,
            min: _min,
            max: _max,
            divisions: _max.toInt(),
            label: currentSliderValue.round().toString(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
