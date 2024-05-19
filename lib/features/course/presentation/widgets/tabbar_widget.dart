import 'package:course_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;

  const TabBarWidget({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppPallet.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 5),
            spreadRadius: -5,
            color: AppPallet.black.withOpacity(0.3),
          )
        ],
      ),
      width: 100.w,
      height: 6.h,
      child: TabBar(
        dividerColor: AppPallet.white,
        indicatorColor: AppPallet.blue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        controller: tabController,
        labelStyle: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: AppPallet.black,
        ),
        unselectedLabelStyle: theme.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: AppPallet.black.withOpacity(0.3),
        ),
        tabs: const [
          Tab(
            text: "Kurikulum",
          ),
          Tab(
            text: "Ikhtisar",
          ),
          Tab(
            text: "Lampiran",
          ),
        ],
      ),
    );
  }
}
