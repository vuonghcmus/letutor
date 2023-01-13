import 'package:flutter/material.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';

class LogoProfileComponent extends StatelessWidget {
  const LogoProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleBox(
          size: 130,
          child: Assets.images.vietnam.image(fit: BoxFit.cover),
        ),
        Positioned(
          left: 90,
          top: 90,
          child: CircleBox(
            size: 50,
            child: const Icon(
              Icons.edit,
              size: 30,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
