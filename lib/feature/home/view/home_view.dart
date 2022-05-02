import 'package:flutter/material.dart';
import 'package:snack_over_vbt/core/init/lang/locale_keys.g.dart';
import 'package:snack_over_vbt/core/init/theme/color/i_color.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = 40;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                generalTitle(textSize),
                Padding(
                  padding: context.verticalPaddingLow,
                  child: searchBar(context),
                ),
                SizedBox(
                  height: context.dynamicHeight(1),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.dynamicHeight(0.2),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: context.paddingLow,
                                child: titleOfTheCard(context),
                              ),
                              commentText(context),
                              SizedBox(
                                height: context.dynamicHeight(0.046),
                                child: Row(
                                  children: [
                                    likeButton(context),
                                    likeNumber(context),
                                    SizedBox(
                                      width: context.dynamicWidth(0.1),
                                    ),
                                    commentIconAndNumber(context)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: context.paddingLow,
        child: Container(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.18),
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.settings),
        ),
      ),
      actions: [
        SizedBox(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.18),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://media.kommunity.com/avatar/059df322-7cda-4157-8e9e-47c4a83426b3_avatar_5f2cf9025e420.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Align generalTitle(double textSize) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        LocaleKeys.home_discover.tr(),
        style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextField searchBar(BuildContext context) {
    return TextField(
      autofocus: false,
      style: context.textTheme.headline4,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for anything you want',
        hintStyle: context.textTheme.headline4,
        filled: true,
        suffixIcon: Icon(Icons.search),
        suffixIconColor: context.colorScheme.primary,
        fillColor: Colors.white54,
        contentPadding: context.paddingLow,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().lightPinkColor),
          borderRadius: context.lowBorderRadius,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors().darkGrey), borderRadius: context.lowBorderRadius),
      ),
    );
  }

  Row titleOfTheCard(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.04),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
        Padding(
          padding: context.horizontalPaddingLow,
          child: Text(
            'Beyza Karadeniz',
            style: context.textTheme.headline5,
          ),
        ),
        Text('.12H ago', style: context.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100)),
      ],
    );
  }

  Padding commentText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac risus posuere, dapibus est non, vestibulum ante. Mauris faucibus mi ex, at pharetra massa condimentum sit amet.',
        maxLines: 3,
        style: context.textTheme.headline6,
      ),
    );
  }

  IconButton likeButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.star,
          color: context.colorScheme.primary,
          size: context.dynamicHeight(0.045),
        ));
  }

  Align likeNumber(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        '12k',
        textAlign: TextAlign.center,
        style: context.textTheme.headline6,
      ),
    );
  }

  Row commentIconAndNumber(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.messenger_rounded,
              color: context.colorScheme.primary,
              size: context.dynamicHeight(0.045),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '12k',
            textAlign: TextAlign.center,
            style: context.textTheme.headline6,
          ),
        ),
      ],
    );
  }

  SizedBox sizedBoxForPadding(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.03),
    );
  }
}
