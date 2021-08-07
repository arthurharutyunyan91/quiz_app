import 'package:flutter/material.dart';
import 'package:quiz_app/model/variant.dart';

class VariantItem extends StatelessWidget {
  final Function(int) onVariantTap;
  final Variant variant;
  final String variantIndex;
  final int selectedButtonID;
  final int rightAnswerId;

  VariantItem(
      {@required this.onVariantTap,
      @required this.variant,
      @required this.variantIndex,
      @required this.selectedButtonID,
      @required this.rightAnswerId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onVariantTap(variant.id),
      child: Container(
        decoration: BoxDecoration(
          color: defineVariantColor(),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '   $variantIndex.  ${variant.content}',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    );
  }

  Color defineVariantColor() {
    var color = Colors.white70;
    if (rightAnswerId != -1) {
      if (rightAnswerId == variant.id) {
        color = Colors.green;
      }
      if (selectedButtonID == variant.id && selectedButtonID != rightAnswerId) {
        color = Colors.red;
      }
    } else if (selectedButtonID == variant.id) {
      color = Colors.amber;
    }
    return color;
  }
}
