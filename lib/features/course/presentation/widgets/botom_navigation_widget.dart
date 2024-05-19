import 'package:course_app/core/theme/app_pallete.dart';
import 'package:course_app/features/course/presentation/bloc/get_course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<GetCourseBloc, GetCourseState>(
      builder: (context, state) {
        if (state is GetCourseLoaded) {
          return Container(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            decoration: BoxDecoration(color: AppPallet.white, boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                color: AppPallet.lightGrey.withOpacity(0.4),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: state.currentUnitIndex > 0
                          ? () {
                              context.read<GetCourseBloc>().add(
                                    OnChangeCourse(
                                      state.currentUnitIndex,
                                      state.listItemCourse,
                                      state.dataUnit,
                                      "prev",
                                      state.dataUnitHasRead,
                                    ),
                                  );
                            }
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        height: 5.h,
                        child: Text(
                          "<< Sebelumnya",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: state.currentUnitIndex > 0
                                ? AppPallet.black
                                : AppPallet.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: state.currentUnitIndex + 1 == state.dataUnit.length
                          ? null
                          : () {
                              context.read<GetCourseBloc>().add(
                                    OnChangeCourse(
                                      state.currentUnitIndex,
                                      state.listItemCourse,
                                      state.dataUnit,
                                      "next",
                                      state.dataUnitHasRead,
                                    ),
                                  );
                            },
                      child: Container(
                        alignment: Alignment.center,
                        height: 5.h,
                        child: Text(
                          "Selanjutnya >>",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: state.currentUnitIndex + 1 ==
                                    state.dataUnit.length
                                ? AppPallet.lightGrey
                                : AppPallet.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
