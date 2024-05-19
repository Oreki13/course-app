import 'package:course_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChapterSectionWidget extends StatelessWidget {
  final String title;
  final String time;

  const ChapterSectionWidget({
    super.key,
    required this.time,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppPallet.extraLightGrey2,
        border: Border(
          top: BorderSide(
            color: AppPallet.extraLightGrey,
            width: 1.sp,
          ),
          bottom: BorderSide(
            color: AppPallet.extraLightGrey,
            width: 1.sp,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2.sp,
          ),
          Text(
            time,
            style: theme.textTheme.bodySmall!.copyWith(color: AppPallet.grey),
          ),
        ],
      ),
    );
  }
}
