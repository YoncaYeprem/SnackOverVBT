import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/color/i_color.dart';
import '../model/onboard_model.dart';
import '../viewmodel/cubit/onboard_cubit.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardCubit>(
      create: (context) => OnboardCubit(),
      child: BlocConsumer<OnboardCubit, OnboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.read<OnboardCubit>().colorList[context.read<OnboardCubit>().currentIndex],
            body: SafeArea(
                child: PageView.builder(
                    controller: context.read<OnboardCubit>().controller,
                    itemCount: onboardItems.length,
                    onPageChanged: (int index) {
                      context.read<OnboardCubit>().changePage(index);
                    },
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: context.paddingMedium,
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: Image.asset(onboardItems[index].image)),
                            Expanded(
                              flex: 2,
                              child: buildDescriptionTexts(index, context),
                            ),
                            Expanded(
                              child: buildIndicator(context),
                            ),
                            Expanded(child: buildBottomRow(context, index))
                          ],
                        ),
                      );
                    })),
          );
        },
      ),
    );
  }

  Column buildDescriptionTexts(int index, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          onboardItems[index].title,
          textAlign: TextAlign.center,
          style: context.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.02),
        ),
        Text(onboardItems[index].description,
            textAlign: TextAlign.center, style: context.textTheme.titleMedium?.copyWith()),
      ],
    );
  }

  Row buildIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          onboardItems.length,
          (index) => Container(
                height: context.dynamicHeight(0.011),
                width: context.read<OnboardCubit>().currentIndex == index
                    ? context.dynamicWidth(0.14)
                    : context.dynamicWidth(0.06),
                margin: EdgeInsets.only(right: context.lowValue),
                decoration: BoxDecoration(
                    color: context.read<OnboardCubit>().currentIndex == index
                        ? AppColors().selectedColor
                        : AppColors().unselectedColor,
                    borderRadius: BorderRadius.all(context.lowRadius)),
              )),
    );
  }

  buildBottomRow(BuildContext context, int index) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                context.read<OnboardCubit>().navigateToLogin(context);
              },
              child: Text(
                LocaleKeys.onboard_skipButton.tr(),
                style: context.textTheme.labelLarge,
              )),
          ElevatedButton(
              onPressed: () {
                context.read<OnboardCubit>().currentIndex == onboardItems.length - 1
                    ? context.read<OnboardCubit>().navigateToLogin(context)
                    : context.read<OnboardCubit>().navigateToNextPage(index);
              },
              style: ElevatedButton.styleFrom(
                  padding: context.horizontalPaddingMedium, primary: Colors.white, shape: const StadiumBorder()),
              child: Text(
                context.read<OnboardCubit>().currentIndex == onboardItems.length - 1
                    ? LocaleKeys.onboard_doneButton.tr()
                    : LocaleKeys.onboard_nextButton.tr(),
                style: context.textTheme.headline6,
              ))
        ],
      ),
    );
  }
}
