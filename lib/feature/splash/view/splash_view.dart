import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../product/widget/custom_lottie_widget.dart';
import '../view_model/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: context.dynamicWidth(0.7),
                      height: context.dynamicHeight(0.7),
                      child: const LottieCustomWidget(path: 'welcome')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
