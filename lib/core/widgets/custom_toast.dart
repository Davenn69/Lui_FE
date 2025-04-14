import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/color_theme.dart';

class CustomToast extends StatelessWidget{
  final String text;
  final bool isError;
  final Function()? onTapError;
  const CustomToast({
    super.key,
    this.text = 'text here',
    this.isError = false,
    this.onTapError
  });

  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48.h),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 17.h,
        ),
        decoration: BoxDecoration(
          color: isError ? colors.error : colors.primary,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTapError,
              child: Container(
                width: 23.w,
                height: 23.w,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50.w)),
                child: SizedBox(
                  width: 12.w,
                  child: Center(
                    child: Icon(
                      isError ? Icons.close : Icons.check,
                      size: 17.w,
                      color: colors.font,
                    ),
                  ),
                ),
              ),
            ),
            Gap(8.w),
            Expanded(
              child: Text(
                text,
                style: textTheme.textButton.copyWith(color: colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}