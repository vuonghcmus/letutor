import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/pdf_view/pdf_controller.dart';

import '../../widgets/app_bar/app_bar_custom.dart';

class PdfView extends GetWidget<PdfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer, controller: controller,),
      body: Center(
        child: PDF().cachedFromUrl(
          controller.url,
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
