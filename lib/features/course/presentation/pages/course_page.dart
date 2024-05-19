// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:auto_route/annotations.dart';
import 'package:course_app/core/theme/app_pallete.dart';
import 'package:course_app/core/utils/convert_time_duration.dart';
import 'package:course_app/core/utils/decode_encoded_string.dart';
import 'package:course_app/features/course/presentation/bloc/get_course_bloc.dart';
import 'package:course_app/features/course/presentation/widgets/appbar_widget.dart';
import 'package:course_app/features/course/presentation/widgets/botom_navigation_widget.dart';
import 'package:course_app/features/course/presentation/widgets/chapter_material_section_widget.dart';
import 'package:course_app/features/course/presentation/widgets/chapter_section_widget.dart';
import 'package:course_app/features/course/presentation/widgets/tabbar_widget.dart';
import 'package:course_app/features/course/presentation/widgets/video_player_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> with TickerProviderStateMixin {
  late VideoPlayerController _controllerVideoPlayer;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aspectRatioKey = GlobalKey();
  late TabController tabController;
  double heightVideo = 0.0;

  @override
  void initState() {
    context.read<GetCourseBloc>().add(GetListCourse());
    super.initState();
  }

  Future<bool> _clearPrevious() async {
    await _controllerVideoPlayer.pause();
    setState(() {
      heightVideo = 0;
    });
    return true;
  }

  void initiateVideoPlayer(String initialVideoUrl) {
    _controllerVideoPlayer =
        VideoPlayerController.networkUrl(Uri.parse(initialVideoUrl))
          ..initialize().then((_) {
            setState(() {});

            Future.delayed(const Duration(milliseconds: 500), () {
              RenderBox box = _aspectRatioKey.currentContext?.findRenderObject()
                  as RenderBox;

              setState(() {
                heightVideo = box.size.height;
              });
            });
          });
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controllerVideoPlayer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const AppBarWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: BlocConsumer<GetCourseBloc, GetCourseState>(builder: (ctx, state) {
        if (state is GetCourseLoaded) {
          return StickyContainer(
            displayOverFlowContent: true,
            stickyChildren: heightVideo == 0
                ? []
                : [
                    StickyWidget(
                      initialPosition:
                          StickyPosition(top: heightVideo + 3.h, left: 0),
                      finalPosition: StickyPosition(top: 0.h, left: 0),
                      controller: _scrollController,
                      child: TabBarWidget(
                        tabController: tabController,
                      ),
                    )
                  ],
            child: SizedBox(
              width: 100.w,
              height: 85.h,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                dragStartBehavior: DragStartBehavior.down,
                children: [
                  _controllerVideoPlayer.value.isInitialized
                      ? VideoPlayerWidget(
                          controllerVideo: _controllerVideoPlayer,
                          aspectRatioKey: _aspectRatioKey,
                          heightVideo: heightVideo,
                          onTapVideo: () {
                            setState(() {
                              _controllerVideoPlayer.value.isPlaying
                                  ? _controllerVideoPlayer.pause()
                                  : _controllerVideoPlayer.play();
                            });
                          },
                        )
                      : Container(
                          height: 25.h,
                          width: 100.w,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: AppPallet.blue,
                          ),
                        ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Text(
                      decodeEncodedString(
                          state.dataUnit[state.currentUnitIndex].title),
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: AppPallet.grey,
                      ),
                    ),
                  ),
                  !_controllerVideoPlayer.value.isInitialized
                      ? TabBarWidget(
                          tabController: tabController,
                        )
                      : Container(),
                  SizedBox(
                    height:
                        _controllerVideoPlayer.value.isInitialized ? 5.h : 0,
                  ),
                  for (int i = 0;
                      i < state.listItemCourse.curriculum.length;
                      i++)
                    state.listItemCourse.curriculum[i].type == "section"
                        ? ChapterSectionWidget(
                            title: decodeEncodedString(
                                state.listItemCourse.curriculum[i].title),
                            time: convertTimeDuration(
                                state.listItemCourse.curriculum[i].duration),
                          )
                        : ChapterMaterialSectionWidget(
                            title: decodeEncodedString(
                                state.listItemCourse.curriculum[i].title),
                            time: convertTimeDuration(
                                state.listItemCourse.curriculum[i].duration),
                            hasDownloaded: false,
                            // hasRead: state.dataUnitHasRead.contains(
                            //     state.listItemCourse.curriculum[i].id),
                            hasRead: ctx.read<GetCourseBloc>().checkIsHasRead(
                                  state.listItemCourse.curriculum[i].id,
                                  state.dataUnitHasRead,
                                ),
                            isSelected:
                                state.dataUnit[state.currentUnitIndex].id ==
                                    state.listItemCourse.curriculum[i].id,
                            type: TypeMatrial.video,
                          ),
                ],
              ),
            ),
          );
        }
        if (state is GetCourseFailed) {
          return SizedBox(
            height: 50.h,
            width: 100.w,
            child: Center(
              child: Text(state.message),
            ),
          );
        }
        return SizedBox(
          height: 50.h,
          width: 100.w,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppPallet.blue,
            ),
          ),
        );
      }, listener: (ctx, state) {
        if (state is GetCourseLoaded) {
          if (heightVideo == 0) {
            initiateVideoPlayer(state.dataUnit.first.onlineVideoLink);
          } else {
            if (state
                .dataUnit[state.currentUnitIndex].onlineVideoLink.isNotEmpty) {
              _clearPrevious().then((_) {
                initiateVideoPlayer(
                    state.dataUnit[state.currentUnitIndex].onlineVideoLink);
              });
            }
          }
        }
      }),
    );
  }
}
