class ConvertTypeData {
  static String goString(dynamic data) {
    if (data == null) return "";
    if (data.runtimeType == String) {
      return data;
    } else {
      return data.toString();
    }
  }

  static int goInteger(dynamic data) {
    if (data == null) return 0;
    if (data.runtimeType == int) {
      return data;
    } else {
      final convert = int.tryParse(data);
      if (convert == null) return 0;
      return convert;
    }
  }
}
