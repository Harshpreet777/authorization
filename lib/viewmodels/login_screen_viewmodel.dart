import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/models/widgets/common_icon_button_model.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class LoginScreenViewModel extends BaseViewModel {
  final ImageConstant imageConstant = ImageConstant();
  late List<CommonIconButtonModel> iconButtonList = [
    CommonIconButtonModel(
      image: imageConstant.googleIcon,
      onTap: () async {},
    ),
    CommonIconButtonModel(
      image: imageConstant.facebookIcon,
      onTap: () async {},
    ),
    CommonIconButtonModel(
      image: imageConstant.twitterIcon,
      onTap: () async{},
    )
  ];
}
