part of 'get_course_bloc.dart';

@immutable
sealed class GetCourseState {}

final class GetCourseInitial extends GetCourseState {}

final class GetCourseLoading extends GetCourseState {}

final class GetCourseLoaded extends GetCourseState {
  final ListItemCourse listItemCourse;
  final int currentUnitIndex;
  final List<Curriculum> dataUnit;
  final List<Curriculum> dataUnitHasRead;

  GetCourseLoaded(this.listItemCourse, this.currentUnitIndex, this.dataUnit,
      this.dataUnitHasRead);
}

final class GetCourseFailed extends GetCourseState {
  final String message;

  GetCourseFailed(this.message);
}
