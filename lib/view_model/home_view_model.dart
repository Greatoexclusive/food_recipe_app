import 'package:food_app_demo/core/services/food_service.dart';
import 'package:food_app_demo/models/food_model.dart';
import 'package:food_app_demo/widgets/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  static final FoodService _foodService = FoodService();
  List<FoodModel> food = [];

  getFood() async {
    setBusy(ViewState.Busy);
    food = await _foodService.getFood();
    setBusy(ViewState.Idle);
  }
}
