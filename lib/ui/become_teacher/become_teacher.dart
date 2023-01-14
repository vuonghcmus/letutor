import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:letutor/models/certifications.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../constants/constants.dart';
import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../resources/gen/assets.gen.dart';
import '../../utils/date_time.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../common/circle_box.dart';
import '../common/text_form_field_custom_component.dart';
import 'become_teacher_controller.dart';
import 'component/avatar_become_teacher_component.dart';
import 'component/header_become_teacher_component.dart';
import 'component/select_major_component.dart';
import 'component/select_targert_student_component.dart';

class BecomeTeacher extends GetWidget<BecomeTeacherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          isHaveDrawer: controller.isHaveDrawer, controller: controller),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: controller.user.value.tutorInfo != null &&
                          controller.user.value.tutorInfo!.id != null
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              CircleBox(
                                  size: 140,
                                  child: Assets.images.iconSmiles.image()),
                              Text(TitleString.youHaveCompletedTheRegistration,
                                  style: text16),
                              const SizedBox(height: 10),
                              Text(TitleString.pleaseWaitForApproval,
                                  style: text16),
                              const SizedBox(height: 10),
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderBecomeTeacherComponent(),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  TitleString.basicInformation,
                                  style: text16.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AvatarBecomeTeacherComponent(
                                  controller: controller,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 2 / 3 - 25,
                                      child: TextFormFieldCustomComponent(
                                          radius: 20,
                                          onChanged: (value) {},
                                          controller:
                                              controller.controllers[name],
                                          hintText: TitleString.tutorName),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: Get.width * 2 / 3 - 25,
                                      child: DropdownButtonFormField(
                                        isExpanded: true,
                                        hint: Text(TitleString.iComeFrom,
                                            style: TextStyle(fontSize: 12)),
                                        items: [
                                          ...languagesCountry.entries
                                              .map((e) => DropdownMenuItem(
                                                    value: e.key,
                                                    child: Text(e.value,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: text14),
                                                  ))
                                        ],
                                        onChanged: (Object? value) {
                                          controller.controllers[country]!
                                              .text = value.toString();
                                          controller.update();
                                        },
                                        value: controller.controllers[country]
                                                    ?.text !=
                                                ""
                                            ? controller
                                                .controllers[country]?.text
                                            : null,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: Get.width * 2 / 3 - 25,
                                      child: TextFormFieldCustomComponent(
                                          radius: 20,
                                          onChanged: (value) {},
                                          readOnly: true,
                                          onTap: () {
                                            showDatePicker(
                                                    initialDatePickerMode:
                                                        DatePickerMode.day,
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1990),
                                                    lastDate: DateTime(2050))
                                                .then((value) => {
                                                      controller
                                                              .controllers[
                                                                  birthdayField]
                                                              ?.text =
                                                          DateFormat(time1)
                                                              .format(value!)
                                                    });
                                          },
                                          controller: controller
                                              .controllers[birthdayField],
                                          hintText: TitleString.dateOfBirth),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  TitleString.cv,
                                  style: text16.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: Get.width - 25,
                                  child: TextFormFieldCustomComponent(
                                      radius: 20,
                                      onChanged: (value) {},
                                      controller:
                                          controller.controllers[interests],
                                      hintText: TitleString.interests),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: Get.width - 25,
                                  child: TextFormFieldCustomComponent(
                                      radius: 20,
                                      onChanged: (value) {},
                                      controller:
                                          controller.controllers[education],
                                      hintText: TitleString.education),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: Get.width - 25,
                                  child: TextFormFieldCustomComponent(
                                      radius: 20,
                                      onChanged: (value) {},
                                      controller:
                                          controller.controllers[experience],
                                      hintText: TitleString.experience),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: Get.width - 25,
                                  child: TextFormFieldCustomComponent(
                                      radius: 20,
                                      onChanged: (value) {},
                                      controller:
                                          controller.controllers[profession],
                                      hintText: TitleString
                                          .currentOrPreviousOccupation),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomDialog(
                                              controller: controller,
                                            );
                                          });
                                    },
                                    child:
                                        Text(TitleString.moreCertifications)),
                                SizedBox(
                                  height: 15,
                                ),
                                Obx(
                                  () => Table(
                                    border: TableBorder.all(),
                                    children: [
                                      TableRow(
                                        children: [
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment.fill,
                                            child: Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(TitleString
                                                    .typeCertification),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment.fill,
                                            child: Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(TitleString.name),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(TitleString.action),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ...controller.certificationsSelected
                                          .map(
                                            (e) => TableRow(
                                              children: [
                                                TableCell(
                                                  verticalAlignment:
                                                      TableCellVerticalAlignment
                                                          .fill,
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(e.name),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  verticalAlignment:
                                                      TableCellVerticalAlignment
                                                          .fill,
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(e
                                                              .fileCertification
                                                              ?.path ??
                                                          ''),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .certificationsSelected
                                                                .remove(e);
                                                            controller.update();
                                                          },
                                                          icon: Icon(
                                                              Icons.delete)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(TitleString.languages, style: text20),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: Get.width - 25,
                                  child: MultiSelectDialogField(
                                    initialValue: [],
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    buttonText: Text(TitleString.languages),
                                    title: Text(TitleString.languages),
                                    items: languagesTeach.entries
                                        .map((e) =>
                                            MultiSelectItem(e.key, e.value))
                                        .toList(),
                                    onConfirm: (values) {
                                      controller.languagesTeachSelected.clear();
                                      values.forEach((element) {
                                        controller.languagesTeachSelected
                                            .add(element);
                                      });
                                      print(controller.languagesTeachSelected);
                                    },
                                    listType: MultiSelectListType.CHIP,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  TitleString.aboutTeaching,
                                  style: text16.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: Get.width - 25,
                                  child: TextFormFieldCustomComponent(
                                      radius: 20,
                                      onChanged: (value) {},
                                      controller: controller.controllers[bio],
                                      hintText: TitleString.bio),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  TitleString.IamTheBestAtTeachingStudents,
                                  style: text16.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SelectTargetStudentComponent(
                                controller: controller),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  TitleString.myMajorIs,
                                  style: text16.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SelectMajorComponent(controller: controller),
                            // TextButton(
                            //   onPressed: () {},
                            //   child: Text(TitleString.addVideoIntro),
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.doRegisterBecomeTeacher();
                              },
                              child: Text(TitleString.confirm),
                            ),
                          ],
                        ),
                ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final BecomeTeacherController controller;

  const CustomDialog({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() {
    return CustomDialogState();
  }
}

class CustomDialogState extends State<CustomDialog> {
  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          SizedBox(
            width: Get.width * 2 / 3 - 25,
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text(TitleString.typeOfCertification),
              items: [
                ...certifications.entries.map((e) => DropdownMenuItem(
                      value: e.key,
                      child: Text(e.value,
                          overflow: TextOverflow.ellipsis, style: text14),
                    ))
              ],
              onChanged: (Object? value) {
                if (widget.controller.certificationHandle == null) {
                  widget.controller.certificationHandle = Certification('', '');
                }
                widget.controller.certificationHandle?.name = value.toString();
              },
              value: widget.controller.certificationHandle?.name != ''
                  ? widget.controller.certificationHandle?.name
                  : null,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                setState(() {
                  if (widget.controller.certificationHandle == null) {
                    widget.controller.certificationHandle =
                        Certification('', '');
                  }
                  widget.controller.certificationHandle?.fileCertification =
                      File(result.files.single.path ?? "");
                  print(widget
                      .controller.certificationHandle?.fileCertification?.path);
                });
              }
            },
            child: SizedBox(
              width: Get.width * 2 / 3 - 25,
              child: Row(
                children: [
                  Text(TitleString.uploadFile),
                  Icon(
                    Icons.upload,
                    size: 30,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.0),
          widget.controller.certificationHandle?.fileCertification != null
              ? SizedBox(
                  width: Get.width * 2 / 3 - 25,
                  child: Text(widget.controller.certificationHandle
                          ?.fileCertification?.path ??
                      ""),
                )
              : SizedBox(),
          SizedBox(height: 24.0),
          InkWell(
            onTap: () {
              widget.controller.certificationsSelected
                  .add(widget.controller.certificationHandle!);
              widget.controller.certificationHandle = null;
              widget.controller.update();
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
