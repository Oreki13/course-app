part of 'get_course_bloc.dart';

@immutable
sealed class GetCourseEvent {}

final class GetListCourse extends GetCourseEvent {}

final class OnChangeCourse extends GetCourseEvent {
  final ListItemCourse dataCourse;
  final int currentIndex;
  final List<Curriculum> dataUnitCuriculum;
  final List<Curriculum> dataUnitCuriculumHasRead;
  final String type;

  OnChangeCourse(
    this.currentIndex,
    this.dataCourse,
    this.dataUnitCuriculum,
    this.type,
    this.dataUnitCuriculumHasRead,
  );
}
