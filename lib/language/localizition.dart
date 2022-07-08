import 'package:fshop/language/arabic.dart';
import 'package:fshop/language/english.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:get/route_manager.dart';

class LoacalizaApp extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    ar: arabicMap,
    en: englishMap
  };

}