import 'package:course_app/core/exception/app_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<AppException, SuccessType>> call(Params param);
}

class NoParams {}
