import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/locale_storage_manager.dart';
import '../../../../core/init/theme/color/i_color.dart';
import '../../../login/view/login.dart';
import '../../model/onboard_model.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial());

  int currentIndex = 0;
  late PageController controller = PageController(initialPage: 0);
  List colorList = [AppColors().lightPinkColor, AppColors().primaryColor, AppColors().backgroundColor];

  void changePage(int index) {
    currentIndex = index;
    emit(OnboardChangePage());
  }

  void navigateToNextPage(index) {
    controller.animateToPage(index == onboardItems.length ? 0 : index + 1,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  Future<void> navigateToLogin(context) async {
    await changeFirstLoginApp();
    context.navigateToPage(LoginView());
  }

  Future<void> changeFirstLoginApp() async {
    await LocaleStorageManager.instance.setBooleanValue(StorageKeys.firstLoginApp, false);
  }
}
