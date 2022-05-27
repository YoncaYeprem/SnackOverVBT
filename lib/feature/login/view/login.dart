import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/image_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/component/circle_button.dart';
import '../../../product/utils/login/email_input_field.dart';
import '../../../product/utils/login/name_input_field.dart';
import '../../../product/utils/login/password_input_field.dart';
import '../viewmodel/cubit/login_cubit.dart';

part 'subView/sign_up_view.dart';
part 'subView/sign_in_view.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _passwordReController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(context),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: DefaultTabController(
              length: 2,
              child: SingleChildScrollView(
                physics: context.read<LoginCubit>().emailLoginNode.hasFocus ||
                        context.read<LoginCubit>().passwordLoginNode.hasFocus
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: context.dynamicHeight(1),
                  child: Column(
                    children: <Widget>[
                      context.emptySizedHeightBoxHigh,
                      SizedBox(
                          height: context.dynamicHeight(0.3), child: Image.asset(ImageConstants.instance.loginTittle)),
                      SizedBox(height: context.dynamicHeight(0.01)),
                      Container(
                        constraints: BoxConstraints.expand(
                          height: context.dynamicHeight(0.08),
                        ),
                        child: TabBar(indicatorColor: Colors.pink, tabs: [
                          Tab(
                            child: Text(
                              LocaleKeys.login_title.tr(),
                              style: context.textTheme.headline6
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              LocaleKeys.login_registerTitle.tr(),
                              style: context.textTheme.headline6
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          signinForm(context, state),
                          signupForm(context, state),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
