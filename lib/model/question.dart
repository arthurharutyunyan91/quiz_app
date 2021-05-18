import 'package:flutter/material.dart';
import 'package:quiz_app/model/variant.dart';

const question_content = 'questionContent';
const question_variants = 'variants';

class Question {
  final String content;
  final List<Variant> variantsList;

  Question({@required this.content, @required this.variantsList});

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
