import 'package:course_app/core/exception/app_exception.dart';
import 'package:course_app/features/course/domain/entitiy/list_item_course.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CourseRepository {
  Future<Either<AppException, ListItemCourse>> getCourse();
}
