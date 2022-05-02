import 'dart:convert';

import 'package:food_app_demo/models/exceptions/Failure.dart';
import 'package:food_app_demo/models/food_model.dart';
import 'package:http/http.dart' as http;

class FoodService {
  Future<List<FoodModel>> getFood(
      {required String q, required int from, required int to}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://api.edamam.com/search?app_id=045beb36&app_key=8367ae8d26be6a790b175a45df519012&q=$q&from=$from&to=$to",
        ),
      );

      final data = jsonDecode(response.body)["hits"];

      final List<FoodModel> foodList = List<FoodModel>.from(
          data.map((e) => FoodModel.fromJson(e["recipe"])));
      return foodList;
    } on Failure {
      rethrow;
    }
  }
}
