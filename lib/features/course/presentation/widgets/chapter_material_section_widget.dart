import 'package:course_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum TypeMatrial { video, info, test }

class ChapterMaterialSectionWidget extends StatelessWidget {
  final String title;
  final String time;
  final bool hasRead;
  final bool hasDownloaded;
  final bool isSelected;
  final TypeMatrial type;

  const ChapterMaterialSectionWidget({
    super.key,
    required this.title,
    required this.time,
    this.hasRead = false,
    this.hasDownloaded = false,
    this.isSelected = false,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.h,
      ),
      color: isSelected ? AppPallet.lightBlue : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          type == TypeMatrial.video
              ? Flexible(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: hasRead ? AppPallet.green : AppPallet.lightGrey,
                    size: 15.sp,
                  ),
                )
              : type == TypeMatrial.info
                  ? Flexible(
                      flex: 2,
                      child: Icon(
                        Icons.info_rounded,
                        color: hasRead ? AppPallet.green : AppPallet.lightGrey,
                        size: 15.sp,
                      ),
                    )
                  : Flexible(
                      flex: 2,
                      child: Icon(
                        Icons.assignment_rounded,
                        color: hasRead ? AppPallet.green : AppPallet.lightGrey,
                        size: 15.sp,
                      ),
                    ),
          Expanded(
            flex: type == TypeMatrial.video ? 4 : 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: AppPallet.grey),
                ),
              ],
            ),
          ),
          type == TypeMatrial.video
              ? Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: 3.5.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 0.5.h,
                          ),
                        ),
                        shadowColor:
                            const WidgetStatePropertyAll(AppPallet.white),
                        overlayColor: WidgetStatePropertyAll(
                          AppPallet.lightGrey.withOpacity(0.2),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          !hasDownloaded ? AppPallet.blue : null,
                        ),
                        shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            side: BorderSide(
                              color: AppPallet.extraLightGrey,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: hasDownloaded
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tersimpan",
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: AppPallet.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Icon(
                                  Icons.check_circle_outline_outlined,
                                  color: AppPallet.blue,
                                  size: 10.sp,
                                )
                              ],
                            )
                          : Text(
                              "Tonton Offline",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppPallet.white,
                              ),
                            ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
