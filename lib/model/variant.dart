const variant_content = 'variantContent';
const is_answer = 'isAnswer';

class Variant {
  final String content;
  final bool isAnswer;
  final int id;

  Variant.fromJson(Map<dynamic, dynamic> json)
      : content = json[variant_content],
        isAnswer = json[is_answer],
        id = json.hashCode;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      variant_content: content,
      is_answer: isAnswer,
    };
  }
}
