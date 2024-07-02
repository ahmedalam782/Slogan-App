import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Models/exercise_home_model.dart';
import '../components/custom_text_form.dart';

GlobalKey<FormState> form = GlobalKey();

void showAlertDialog({
  required BuildContext context,
  required Function() onTap,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: Colors.black,
          elevation: 0,
          contentPadding: EdgeInsets.all(
            3.h,
          ),
          title: Text(
            "Enter the new exercise",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "SpaceMono",
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          content: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                  labelText: "Exercise",
                  controller: exerciseController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Exercise ';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextForm(
                  labelText: "Date",
                  controller: dateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Date ';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 25.w,
                height: 5.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  color: Colors.green,
                ),
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
            ),
          ],
        );
      });
}
