part of '../login.dart';

extension SignUpEmaiilForm on LoginView {
  Padding signupForm(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          EmailInput(controller: _emailController),
          SizedBox(height: context.dynamicHeight(0.01)),
          PasswordInputField(
            controller: _passwordController,
            onValidator: (value) => _passwordController.text == value ? null : LocaleKeys.validation_notSameText.tr(),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          SizedBox(
            width: context.dynamicWidth(0.9),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(elevation: 10, shadowColor: Colors.pink, primary: (Colors.pink)),
                child: Text(LocaleKeys.login_title.tr())),
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
          Text(LocaleKeys.login_orLogin.tr()),
          SizedBox(height: context.dynamicHeight(0.04)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIconButton(
                color: Colors.blue,
                icon: FontAwesomeIcons.facebookF,
                height: context.dynamicHeight(0.08),
                onPressed: () {},
              ),
              CircleIconButton(
                color: Colors.red, //TODO renkleri temadan çekilecektir
                icon: FontAwesomeIcons.google,
                height: context.dynamicHeight(0.08),
                onPressed: () {},
              ),
              CircleIconButton(
                color: Colors.blue,
                icon: FontAwesomeIcons.twitter,
                height: context.dynamicHeight(0.08),
                onPressed: () {},
              ),
              CircleIconButton(
                color: Colors.black,
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
