class IngridientsModel {
  final String food;
  final String text;
  final String image;

  IngridientsModel({
    required this.food,
    required this.text,
    required this.image,
  });

  factory IngridientsModel.fromJson(Map<String, dynamic> json) {
    return IngridientsModel(
      food: json["food"],
      text: json["text"],
      image: json["image"],
    );
  }
  Map<String, dynamic> toJson() => {
        "food": food,
        "text": text,
        "image": image,
      };
}
