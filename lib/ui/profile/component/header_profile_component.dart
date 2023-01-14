import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../profile_controller.dart';
import 'logo_profile_component.dart';

class HeaderProfileComponent extends StatelessWidget {
  final ProfileController controller;

  const HeaderProfileComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoProfileComponent(),
          Text(
            controller.user.value.name ?? '',
            style: text28.copyWith(
                color: const Color.fromRGBO(36, 38, 38, 1.0),
                fontWeight: FontWeight.w700),
          ),
          Text(
            controller.user.value.id ?? '',
            style: text28.copyWith(
                color: Colors.grey, fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: () => {},
            child: Text(
              TitleString.seeYourReview,
              style: text14.copyWith(
                  color: Colors.blue, fontWeight: FontWeight.w700),
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
