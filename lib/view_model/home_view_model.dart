import 'package:flutter/material.dart';
import 'package:food_app_demo/core/services/food_service.dart';
import 'package:food_app_demo/models/food_model.dart';
import 'package:food_app_demo/widgets/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  static final FoodService _foodService = FoodService();
  final myController = TextEditingController();

  List<FoodModel> food = [];

  getFood(search, from, to) async {
    setBusy(ViewState.Busy);
    search = myController.text;
    food = await _foodService.getFood(
        q: search == "" ? "sushi" : search, from: from, to: to);
    setBusy(ViewState.Idle);
  }

  getItem(value) async {
    setBusy(ViewState.Busy);
    food = await _foodService.getFood(
      q: value,
      from: 0,
      to: 10,
    );
    setBusy(ViewState.Idle);
  }
}
