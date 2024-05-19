import 'package:course_app/core/theme/app_pallete.dart';
import 'package:course_app/features/course/presentation/bloc/get_course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: IconButton(
          onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
      title: BlocBuilder<GetCourseBloc, GetCourseState>(
        builder: (ctx, state) => Text(
          state is GetCourseLoaded ? state.listItemCourse.courseName : "Course",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: AppPallet.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        BlocBuilder<GetCourseBloc, GetCourseState>(builder: (ctx, state) {
          if (state is GetCourseLoaded) {
            return SizedBox(
              width: 12.w,
              height: 12.w,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    showLabels: false,
                    showTicks: false,
                    startAngle: 270,
                    endAngle: 270,
                    radiusFactor: 0.75,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.18,
                      color: AppPallet.lightGrey,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: double.parse(state.listItemCourse.progress),
                        width: 0.18,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                        enableAnimation: true,
                        animationDuration: 75,
                        animationType: AnimationType.linear,
                        color: AppPallet.green,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0.1,
                        widget: Text(
                          '${int.parse(state.listItemCourse.progress).toStringAsFixed(0)}%',
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 6.sp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        })
      ],
    );
  }
}
