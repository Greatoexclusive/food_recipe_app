import 'package:flutter/material.dart';
import 'package:food_app_demo/core/services/food_service.dart';
import 'package:food_app_demo/models/food_model.dart';
import 'package:food_app_demo/widgets/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  static final FoodService _foodService = FoodService();
  final myController = TextEditingController();
  static const int pageLimit = 20;
  int page = 0;

  List<FoodModel> food = [];

  // whan tab items are tapped
  getItemForHelper(value) async {
    food.clear();
    page = 0;
    myController.text = value;
    _fetchData();
  }

  // get item from controller text
  getItem() async {
    food.clear();
    page = 0;
    _fetchData();
  }

  //get more item
  getMore() {
    page++;

    //get data
    _fetchData();
  }

  _fetchData() async {
    setBusy(ViewState.Busy);
    food.addAll(await _foodService.getFood(
      q: myController.text.isEmpty ? "sushi" : myController.text,
      from: page == 0 ? 0 : (pageLimit * page + 1),
      to: page == 0 ? pageLimit : (1 + page) * pageLimit,
    ));
    setBusy(ViewState.Idle);
  }
}
