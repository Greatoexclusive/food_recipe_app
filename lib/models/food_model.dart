import 'package:food_app_demo/models/ingridients_model.dart';

class FoodModel {
  final String label;
  final double totalTime;
  final String image;
  final List<IngridientsModel> ingredients;

  FoodModel({
    required this.label,
    required this.totalTime,
    required this.image,
    required this.ingredients,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      label: json["label"],
      totalTime: json["totalTime"],
      image: json["image"],
      ingredients: List<IngridientsModel>.from(
          json["ingredients"].map((x) => IngridientsModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "label": label,
        "totalTime": totalTime,
        "image": image,
        "ingredients": ingredients,
      };
}
