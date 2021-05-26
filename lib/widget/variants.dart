import 'package:flutter/material.dart';
import 'package:quiz_app/model/variant.dart';
import 'package:quiz_app/widget/variant_item.dart';

class Variants extends StatelessWidget {
  final List<Variant> variants;
  final Function(int) onVariantTap;
  final int selectedButtonId;
  final int rightAnswerID;

  Variants(
      {@required this.variants,
      @required this.selectedButtonId,
      @required this.onVariantTap,
      @required this.rightAnswerID});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VariantItem(
          onVariantTap: (id) => onVariantTap(id),
          variant: variants[0],
          variantIndex: 'A',
          selectedButtonID: selectedButtonId,
          rightAnswerId: rightAnswerID,
        ),
        VariantItem(
          onVariantTap: (id) => onVariantTap(id),
          variant: variants[1],
          variantIndex: 'B',
          selectedButtonID: selectedButtonId,
          rightAnswerId: rightAnswerID,
        ),
        VariantItem(
          onVariantTap: (id) => onVariantTap(id),
          variant: variants[2],
          variantIndex: 'C',
          selectedButtonID: selectedButtonId,
          rightAnswerId: rightAnswerID,
        ),
        VariantItem(
          onVariantTap: (id) => onVariantTap(id),
          variant: variants[3],
          variantIndex: 'D',
          selectedButtonID: selectedButtonId,
          rightAnswerId: rightAnswerID,
        ),
      ],
    );
  }
}
