import 'package:flutter/material.dart';
import '../../../resources/font/font_text.dart';
import 'logo_profile_component.dart';

class HeaderProfileComponent extends StatelessWidget {
  const HeaderProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoProfileComponent(),
          Text(
            "Trương Quốc Vương",
            style: text28.copyWith(
                color: const Color.fromRGBO(36, 38, 38, 1.0),
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Id: 123456789",
            style: text28.copyWith(
                color: Colors.grey, fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: () => {},
            child: Text(
              "Xem đánh giá của bạn",
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
