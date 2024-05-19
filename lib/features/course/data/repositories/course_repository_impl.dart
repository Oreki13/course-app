import 'package:course_app/core/exception/app_exception.dart';
import 'package:course_app/features/course/data/datasources/course_remote_data_source.dart';
import 'package:course_app/features/course/domain/entitiy/list_item_course.dart';
import 'package:course_app/features/course/domain/repositories/course_repository.dart';
import 'package:fpdart/src/either.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;

  CourseRepositoryImpl(this.courseRemoteDataSource);

  @override
  Future<Either<AppException, ListItemCourse>> getCourse() {
    return courseRemoteDataSource.getCourse();
  }
}
