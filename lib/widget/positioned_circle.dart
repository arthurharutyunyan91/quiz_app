import 'package:flutter/material.dart';

class PositionedCircle extends StatelessWidget {
  final Offset offset;
  final AlignmentGeometry alignment;
  final double circleSize;
  final bool stroke;
  final double strokeFactor;
  final Color circleColor;
  final Color strokeColor;
  final double strokeWidth;

  PositionedCircle(
      {@required this.circleSize,
      @required this.circleColor,
      this.strokeColor,
      this.offset = const Offset(0, 0),
      this.alignment = Alignment.center,
      this.strokeFactor = 1,
      this.strokeWidth = 1,
      this.stroke = false});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Align(
        alignment: alignment,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
            ),
            if (stroke)
              Container(
                width: circleSize * strokeFactor,
                height: circleSize * strokeFactor,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: strokeColor ?? circleColor, width: strokeWidth)),
              ),
          ],
        ),
      ),
    );
  }
}
