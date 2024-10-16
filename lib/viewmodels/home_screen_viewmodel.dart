import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/models/response/restaurants_repsonse_model.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class HomeScreenViewModel extends BaseViewModel {
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();

  late List<RestaurantResponseModel> restaurantList = [
    RestaurantResponseModel(
        image: imageConstant.pizzaImg,
        name: stringConstants.thePizzaPlace,
        distance: '2'),
    RestaurantResponseModel(
        image: imageConstant.iceCreamImg,
        name: stringConstants.iceCreamFactory,
        distance: '1.5'),
    RestaurantResponseModel(
        image: imageConstant.burgerImg,
        name: stringConstants.burgerKing,
        distance: '7'),
    RestaurantResponseModel(
        image: imageConstant.coffeeImg,
        name: stringConstants.theCoffeeHouse,
        distance: '5')
  ];
}
