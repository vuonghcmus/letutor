import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';

class HeaderDashBoardComponent extends StatelessWidget {
  const HeaderDashBoardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TitleString.dashBoardUpComing,
            style: text28.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'T7, 22 Thg 10 22 00:00 - 00:25',
                textAlign: TextAlign.center,
                style: text18.copyWith(color: Colors.white),
              ),
              Text(
                '(còn 08:51:34)',
                style: text16.copyWith(
                    color: Colors.amber),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            TitleString.dashBoardTotalTime,
            textAlign: TextAlign.center,
            style: text18.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextButton(onPressed: () {  }, child: Text(TitleString.dashBoardEnterRoom),
              
                ),
          ),
        ],
      ),
    );
  }
}
