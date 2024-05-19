import 'package:course_app/core/dio/dio_service.dart';
import 'package:course_app/core/dio/network_service.dart';
import 'package:course_app/features/course/data/datasources/course_remote_data_source.dart';
import 'package:course_app/features/course/data/repositories/course_repository_impl.dart';
import 'package:course_app/features/course/domain/repositories/course_repository.dart';
import 'package:course_app/features/course/domain/usecase/get_course.dart';
import 'package:course_app/features/course/presentation/bloc/get_course_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  final Dio dio = Dio();
  getIt.registerLazySingleton<NetworkService>(() => DioNetworkService(dio));
  _initCourse();
}

void _initCourse() {
  getIt
    ..registerFactory<CourseRemoteDataSource>(
        () => CourseRemoteDataSourceImpl(getIt()))
    ..registerFactory<CourseRepository>(() => CourseRepositoryImpl(getIt()))
    ..registerFactory(() => GetCourse(getIt()))
    ..registerLazySingleton(() => GetCourseBloc(getCourse: getIt()));
}
