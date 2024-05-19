import 'package:bloc/bloc.dart';
import 'package:course_app/core/usecase/usecase.dart';
import 'package:course_app/features/course/domain/entitiy/list_item_course.dart';
import 'package:course_app/features/course/domain/usecase/get_course.dart';
import 'package:meta/meta.dart';

part 'get_course_event.dart';
part 'get_course_state.dart';

class GetCourseBloc extends Bloc<GetCourseEvent, GetCourseState> {
  final GetCourse _getCourse;

  GetCourseBloc({required GetCourse getCourse})
      : _getCourse = getCourse,
        super(GetCourseInitial()) {
    on<GetCourseEvent>((event, emit) {
      emit(GetCourseLoading());
    });
    on<GetListCourse>(_getDataCourse);
    on<OnChangeCourse>(_onTapNextCourse);
  }

  void _getDataCourse(GetListCourse event, Emitter<GetCourseState> emit) async {
    final res = await _getCourse.call(NoParams());
    res.fold(
      (l) => emit(GetCourseFailed(l.message)),
      (r) {
        emit(GetCourseLoaded(r, 0, _findUnitCourse(r.curriculum), []));
      },
    );
  }

  List<Curriculum> _findUnitCourse(List<Curriculum> datas) {
    List<Curriculum> result = [];
    for (var data in datas) {
      if (data.type == "unit") {
        result.add(data);
      }
    }
    return result;
  }

  void _onTapNextCourse(OnChangeCourse event, Emitter<GetCourseState> emit) {
    if (event.type == "next") {
      if (!event.dataUnitCuriculumHasRead
          .contains(event.dataUnitCuriculum[event.currentIndex].id)) {
        event.dataUnitCuriculumHasRead
            .add(event.dataUnitCuriculum[event.currentIndex]);
      }
      emit(GetCourseLoaded(event.dataCourse, event.currentIndex + 1,
          event.dataUnitCuriculum, event.dataUnitCuriculumHasRead));
      return;
    } else {
      emit(GetCourseLoaded(event.dataCourse, event.currentIndex - 1,
          event.dataUnitCuriculum, event.dataUnitCuriculumHasRead));
      return;
    }
  }

  bool checkIsHasRead(int theId, List<Curriculum> dataUnitHasRead) {
    bool result = false;
    for (int i = 0; i < dataUnitHasRead.length; i++) {
      if (dataUnitHasRead[i].id == theId) {
        result = true;
        break;
      }
    }
    return result;
  }
}
