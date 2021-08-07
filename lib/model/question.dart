import 'package:flutter/material.dart';
import 'package:quiz_app/model/variant.dart';

class Question {
  static const question_content = 'questionContent';
  static const question_variants = 'variants';
  static const question_winners = 'winnerUsers';

  final String content;
  final List<Variant> variantsList;

  Question.fromJson(Map<dynamic, dynamic> data)
      : content = data[question_content],
        variantsList = _variantsToList(data[question_variants]);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'questionContent': content,
    };
  }

  static _variantsToList(Map<dynamic, dynamic> variantsData) {
    var resultVariants = <Variant>[];
    variantsData.values.toList().forEach((element) {
      resultVariants.add(Variant.fromJson(element));
    });
    return resultVariants;
  }
}
