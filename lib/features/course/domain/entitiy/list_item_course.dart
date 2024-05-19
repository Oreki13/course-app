class ListItemCourse {
  final String courseName;
  final String progress;
  final List<Curriculum> curriculum;

  ListItemCourse({
    required this.courseName,
    required this.progress,
    required this.curriculum,
  });
}

class Curriculum {
  final int key;
  final dynamic id;
  final String type;
  final String title;
  final int duration;
  final String content;
  final List<dynamic> meta;
  final int status;
  final String onlineVideoLink;
  final String offlineVideoLink;

  Curriculum({
    required this.key,
    required this.id,
    required this.type,
    required this.title,
    required this.duration,
    required this.content,
    required this.meta,
    required this.status,
    required this.onlineVideoLink,
    required this.offlineVideoLink,
  });
}
