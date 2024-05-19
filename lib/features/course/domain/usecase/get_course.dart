import 'package:course_app/core/exception/app_exception.dart';
import 'package:course_app/core/usecase/usecase.dart';
import 'package:course_app/features/course/domain/entitiy/list_item_course.dart';
import 'package:course_app/features/course/domain/repositories/course_repository.dart';
import 'package:fpdart/src/either.dart';

class GetCourse implements UseCase<ListItemCourse, NoParams> {
  final CourseRepository courseRepository;

  GetCourse(this.courseRepository);

  @override
  Future<Either<AppException, ListItemCourse>> call(NoParams param) {
    return courseRepository.getCourse();
  }
}
