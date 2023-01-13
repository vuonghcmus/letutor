import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';
import '../../common/text_icon.dart';

class TeacherInformationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBox(
                    size: 110,
                    child: Assets.images.vietnam.image(fit: BoxFit.cover)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quan dz',
                      style: text20.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 4,
                      maxRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Assets.svg.vietnam.svg(height: 15, width: 25),
                        SizedBox(width: 15),
                        Text(
                          'Viet Nam',
                          style: text16,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Học, học nữa, học mãi.',
            style: text16.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextIcon(
                iconData: Icons.favorite,
                title: TitleString.favorite,
              ),
              TextIcon(
                iconData: Icons.report,
                title: TitleString.report,
              ),
              InkWell(
                onTap: () {
                  // Get.toNamed(AppRoutes.REVIEW);
                },
                child: TextIcon(
                  iconData: Icons.star,
                  title: TitleString.reviews,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}