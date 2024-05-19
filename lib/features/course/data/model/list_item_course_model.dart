import 'package:course_app/core/utils/convert_type_data.dart';
import 'package:course_app/features/course/domain/entitiy/list_item_course.dart';

class ListItemCourseModel extends ListItemCourse {
  ListItemCourseModel({
    required super.courseName,
    required super.progress,
    required super.curriculum,
  });

  factory ListItemCourseModel.fromJson(Map<String, dynamic> json) =>
      ListItemCourseModel(
        courseName: json["course_name"],
        progress: json["progress"],
        curriculum: List<Curriculum>.from(
          json["curriculum"].map(
            (x) => CurriculumModel.fromJson(x),
          ),
        ),
      );
}

class CurriculumModel extends Curriculum {
  CurriculumModel(
      {required super.key,
      required super.id,
      required super.type,
      required super.title,
      required super.duration,
      required super.content,
      required super.meta,
      required super.status,
      required super.onlineVideoLink,
      required super.offlineVideoLink});

  factory CurriculumModel.fromJson(Map<String, dynamic> json) =>
      CurriculumModel(
        key: ConvertTypeData.goInteger(json["key"]),
        id: ConvertTypeData.goInteger(json["id"]),
        type: ConvertTypeData.goString(json["type"]),
        title: ConvertTypeData.goString(json["title"]),
        duration: ConvertTypeData.goInteger(json["duration"]),
        content: ConvertTypeData.goString(json["content"]),
        meta: List<dynamic>.from(
          json["meta"].map((x) => x),
        ),
        status: ConvertTypeData.goInteger(json["status"]),
        onlineVideoLink: ConvertTypeData.goString(json["online_video_link"]),
        offlineVideoLink: ConvertTypeData.goString(json["offline_video_link"]),
      );
}
