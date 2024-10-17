import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/models/response/menu_card_response_model.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class MenuScreenViewModel extends BaseViewModel {
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final MessageConstant messageConstant = MessageConstant();
  late List<MenuCardScreenModel> classicPizzaList = [
    MenuCardScreenModel(
        image: imageConstant.pizza2Img,
        desc: messageConstant.bbqChicken,
        name: stringConstants.bbqChicken),
    MenuCardScreenModel(
        image: imageConstant.pizza3Img,
        desc: messageConstant.bbqBeef,
        name: stringConstants.bbqBeef),
    MenuCardScreenModel(
        image: imageConstant.pizza4Img,
        desc: messageConstant.veggieSupreme,
        name: stringConstants.veggieSupreme)
  ];
  late List<MenuCardScreenModel> premiumPizzaList = [
    MenuCardScreenModel(
        image: imageConstant.pizza5Img,
        desc: messageConstant.bbqMega,
        name: stringConstants.bbqMega),
    MenuCardScreenModel(
        image: imageConstant.pizza6Img,
        desc: messageConstant.chickenBali,
        name: stringConstants.chickenBali),
    MenuCardScreenModel(
        image: imageConstant.pizza7Img,
        desc: messageConstant.extravaganzza,
        name: stringConstants.extravaganzza)
  ];
  late List<MenuCardScreenModel> sidesList = [
    MenuCardScreenModel(
        image: imageConstant.chickenWing,
        desc: messageConstant.chickenWings,
        name: stringConstants.chickenWings),
    MenuCardScreenModel(
        image: imageConstant.frenchFries,
        desc: messageConstant.frenchFries,
        name: stringConstants.frenchFries),
    MenuCardScreenModel(
        image: imageConstant.salad,
        desc: messageConstant.salad,
        name: stringConstants.salad)
  ];
  late List<MenuCardScreenModel> drinksList = [
    MenuCardScreenModel(
        image: imageConstant.soda,
        desc: messageConstant.soda,
        name: stringConstants.soda),
    MenuCardScreenModel(
        image: imageConstant.water,
        desc: messageConstant.water,
        name: stringConstants.water),
  ];
}
