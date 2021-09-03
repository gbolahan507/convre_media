import 'package:convre/export.dart';
import 'package:flutter/material.dart';
import 'text_widgets.dart';

Widget customButtom(
  BuildContext context, {
  final text,
  final buttonColor,
  final textColor,
  final function,
  final borderColor,
  final fontSize,
  final horiMargin,
  final width,
  final bool busy = false,
}) {
  SizeConfig.init(context);
  return InkWell(
    onTap: function,
    child: Container(
      width: width,
      alignment: Alignment.center,
      padding:
          EdgeInsets.symmetric(vertical: 13.h, horizontal: horiMargin ?? 0),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5.h),
          border: Border.all(color: borderColor)),
      child: Center(
        child: busy
            ? SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                height: 20.h,
                width: 20.h,
              )
            : regularSansText(
                context,
                text: text,
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
      ),
    ),
  );
}
