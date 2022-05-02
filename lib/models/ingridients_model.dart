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
      food: json["food"] ??= "Ingredients",
      text: json["text"] ??= "Ingredients",
      image: json["image"] ??=
          "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc=",
    );
  }
  Map<String, dynamic> toJson() => {
        "food": food,
        "text": text,
        "image": image,
      };
}
