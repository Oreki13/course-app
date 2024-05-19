String convertTimeDuration(int time) {
  String result = "";
  if (time < 60) {
    result = "$time Detik";
  } else if (time < 3600) {
    int menit = time ~/ 60;
    result = "$menit Menit";
  } else {
    int jam = time ~/ 3600;
    int menitSisa = time % 3600;
    int menit = menitSisa ~/ 60;
    result = "$jam Jam $menit Menit";
  }
  return result;
}
