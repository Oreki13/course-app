import 'package:course_app/core/dio/network_service.dart';
import 'package:course_app/core/exception/app_exception.dart';
import 'package:course_app/features/course/data/model/list_item_course_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CourseRemoteDataSource {
  Future<Either<AppException, ListItemCourseModel>> getCourse();
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  final NetworkService networkService;

  CourseRemoteDataSourceImpl(this.networkService);

  @override
  Future<Either<AppException, ListItemCourseModel>> getCourse() async {
    final res = await networkService.get("/course-status.json");
    return res.fold((l) => Left(l), (r) {
      try {
        return Right(ListItemCourseModel.fromJson(r.data));
      } catch (e) {
        return Left(AppException(message: "Failed to parse"));
      }
    });
  }
}
