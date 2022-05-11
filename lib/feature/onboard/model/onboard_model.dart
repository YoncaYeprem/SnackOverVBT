import 'package:easy_localization/easy_localization.dart';

import '../../../core/constants/image_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class OnboardModel {
  String title;
  String description;
  String image;
  OnboardModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardModel> onboardItems = [
  OnboardModel(
      title: LocaleKeys.onboard_onboardTitlePage1.tr(),
      description: LocaleKeys.onboard_onboardContentPage1.tr(),
      image: ImageConstants.instance.think),
  OnboardModel(
      title: LocaleKeys.onboard_onboardTitlePage2.tr(),
      description: LocaleKeys.onboard_onboardContentPage2.tr(),
      image: ImageConstants.instance.ask),
  OnboardModel(
      title: LocaleKeys.onboard_onboardTitlePage3.tr(),
      description: LocaleKeys.onboard_onboardContentPage3.tr(),
      image: ImageConstants.instance.people)
];
