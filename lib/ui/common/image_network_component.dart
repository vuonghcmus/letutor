import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/gen/assets.gen.dart';

class ImageNetworkComponent extends StatelessWidget {
  String url;

  ImageNetworkComponent({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    try {
      widget = CachedNetworkImage(

        errorWidget: (context, error, stackTrace) {
          return Assets.images.notFoundImages.image();
        },
        imageUrl: url,
      );
    } catch (e) {
      widget = Assets.images.notFoundImages.image();
    }
    return widget;
  }
}
