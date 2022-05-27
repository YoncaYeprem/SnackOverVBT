part of '../login.dart';

extension SignInForm on LoginView {
  Padding signinForm(BuildContext context, LoginState state) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          EmailInput(
              controller: context.read<LoginCubit>().emailLoginController,
              node: context.read<LoginCubit>().emailLoginNode),
          SizedBox(height: context.dynamicHeight(0.01)),
          PasswordInputField(
            controller: context.read<LoginCubit>().passwordLoginController,
            node: context.read<LoginCubit>().passwordLoginNode,
            onValidator: (value) => context.read<LoginCubit>().passwordLoginController.text == value
                ? null
                : LocaleKeys.validation_notSameText.tr(),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          SizedBox(
            width: context.dynamicWidth(0.9),
            child: ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().signInWithEmailPassword();
                },
                style: ElevatedButton.styleFrom(elevation: 10, shadowColor: Colors.pink, primary: (Colors.pink)),
                child: context.read<LoginCubit>().isloading
                    ? const Center(child: CircularProgressIndicator())
                    : Text(LocaleKeys.login_title.tr())),
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
          Text(
            LocaleKeys.login_orLogin.tr(),
            style: context.textTheme.headline5,
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleIconButton(
                color: context.colorScheme.error,
                icon: FontAwesomeIcons.google,
                height: context.dynamicHeight(0.08),
                onPressed: () async {
                  context.read<LoginCubit>().signInWithGoogle();
                },
              ),
              CircleIconButton(
                color: context.colorScheme.onError,
                icon: FontAwesomeIcons.apple,
                height: context.dynamicHeight(0.08),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
