import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/utils/login/password_input_field.dart';

import '../../../core/constants/image_constants.dart';
import '../../../product/component/circle_button.dart';
import '../../../product/utils/login/email_input_field.dart';
import '../../../product/component/firebase/auth_functions.dart';
import '../../../product/utils/login/name_input_field.dart';
import '../viewmodel/cubit/login_cubit.dart';
part 'subView/signup_view.dart';
part 'subView/signin_view.dart';

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
              child: Column(
                children: <Widget>[
                  SizedBox(height: context.dynamicHeight(0.06)),
                  SizedBox(height: context.dynamicHeight(0.3), child: Image.asset(ImageConstants.instance.loginTittle)),
                  SizedBox(height: context.dynamicHeight(0.01)),
                  Container(
                    constraints: BoxConstraints.expand(
                      height: context.dynamicHeight(0.08),
                    ),
                    child: TabBar(indicatorColor: Colors.pink, tabs: [
                      Tab(
                        child: Text(
                          LocaleKeys.login_title.tr(),
                          style:
                              context.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          LocaleKeys.login_registerTitle.tr(),
                          style:
                              context.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(children: [
                        signupForm(context, state),
                        signinForm(context, state),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
