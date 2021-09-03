import 'package:convre/export.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Function(String) validator;
  final Function(String) onSaved;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final Function(String) onChanged;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;
  final String obscuringCharacter;

  CustomTextField({
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly,
    this.obscureText = false,
    this.obscuringCharacter,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return TextFormField(
      cursorColor: AppColors.black.withOpacity(0.4),
      cursorWidth: 1.w,
      cursorHeight: 15.h,
      maxLines: 1,
      textInputAction: textInputAction,
      style: GoogleFonts.openSans(
        color: AppColors.pitchBlack,
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        letterSpacing: 0.4,
      ),
      // readOnly: readOnly,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 15.w,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.openSans(
          color: AppColors.darkTextGrey,
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        // obscureText == null
        //           ? null
        //           : IconButton(
        //               icon: obscureText
        //                   ? Icon(Icons.visibility_off,
        //                       color: AppColors.black.withOpacity(0.3))
        //                   : Icon(Icons.visibility,
        //                       color: AppColors.black.withOpacity(0.5)),
        //               onPressed: () {
        //                 setState(
        //                   () {
        //                     obscure = !obscure;
        //                   },
        //                 );
        //               },
        //             ),

        filled: true,
        fillColor: AppColors.containerColor.withOpacity(0.5),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(5.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textBlue),
          borderRadius: BorderRadius.circular(5.h),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 0.5),
          borderRadius: BorderRadius.circular(5.h),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(5.h),
        ),
      ),
      obscureText: obscureText,
      obscuringCharacter: '●',
      controller: controller,
      textAlign: textAlign,
      keyboardType: textInputType,
      onFieldSubmitted: onSaved,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
