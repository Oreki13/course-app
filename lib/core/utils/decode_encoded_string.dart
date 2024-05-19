import 'package:html/parser.dart';

String decodeEncodedString(String encodedString) {
  final document = parse(encodedString);
  final text = document.body!.text;
  return text;
}
