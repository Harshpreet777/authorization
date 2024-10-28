import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/font_constant.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/message_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/theme/app_color.dart';
import 'package:flutter_boilerplate/viewmodels/menu_screen_viewmodel.dart';
import 'package:flutter_boilerplate/views/screens/base_view.dart';
import 'package:flutter_boilerplate/views/screens/pizza_menu_tabs/classic_pizza_tab.dart';
import 'package:flutter_boilerplate/views/screens/pizza_menu_tabs/combo_deals_tab.dart';
import 'package:flutter_boilerplate/views/screens/pizza_menu_tabs/drinks_tab.dart';
import 'package:flutter_boilerplate/views/screens/pizza_menu_tabs/premium_pizza_tab.dart';
import 'package:flutter_boilerplate/views/screens/pizza_menu_tabs/sides_tab.dart';
import 'package:flutter_boilerplate/views/widgets/app_components/common_review.dart';
import 'package:flutter_boilerplate/views/widgets/components/common_text_widget.dart';
import 'package:flutter_boilerplate/views/widgets/components/custom_scaffold.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final ImageConstant imageConstant = ImageConstant();
  final StringConstants stringConstants = StringConstants();
  final AppColor appColor = AppColor();
  final FontConstants fontConstants = FontConstants();
  final MessageConstant messageConstant = MessageConstant();

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuScreenViewModel>(
      viewModel: MenuScreenViewModel(),
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 5,
          child: CustomScaffold(
            showAppBar: false,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              imageConstant.pizzaImg,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned(
                              top: 65,
                              left: 25,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                                  color: appColor.white.withOpacity(0.4),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 15,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  color: appColor.black.withOpacity(0.5),
                                ),
                                child: CommonTextWidget(
                                  stringConstants.freeDelivery,
                                  style: TextStyle(
                                    color: appColor.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: fontConstants.gilroy,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextWidget(
                                stringConstants.thePizzaPlace,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: appColor.black,
                                  fontFamily: fontConstants.gilroy,
                                ),
                              ),
                              CommonTextWidget(
                                stringConstants.deliveryTime,
                                style: TextStyle(
                                  color: appColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: fontConstants.gilroy,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CommonReviewWidget(
                            distance: "2",
                            size: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Container(
                            color: appColor.transparent,
                            child: TabBar(
                              unselectedLabelColor: appColor.black500,
                              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                              dividerColor: appColor.transparent,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              labelColor: appColor.black,
                              labelStyle: TextStyle(
                                fontSize: 13,
                                fontFamily: fontConstants.gilroy,
                                fontWeight: FontWeight.w500,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 11,
                                fontFamily: fontConstants.gilroy,
                                fontWeight: FontWeight.w500,
                              ),
                              tabs: [
                                Tab(text: stringConstants.comboDeals),
                                Tab(text: stringConstants.classicPizza),
                                Tab(text: stringConstants.premiumPizza),
                                Tab(text: stringConstants.sides),
                                Tab(text: stringConstants.drinks),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ComboDealsTab(viewModel: viewModel),
                      ClassicPizzaTab(viewModel: viewModel),
                      PremiumPizzaTab(viewModel: viewModel),
                      SidesTab(viewModel: viewModel),
                      DrinksTab(viewModel: viewModel),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
