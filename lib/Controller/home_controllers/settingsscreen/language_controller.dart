import 'package:get/get.dart';

abstract class LanguageController extends GetxController {
  updateColor(int index);
}

class LanguageControllerImp extends LanguageController {
  List<String> languages = [
    "English",
    "Français",
  ];
  LanguageControllerImp() {
    isSelectedList = List<bool>.filled(languages.length, false);
    isSelectedList[0] = true;
  }
  List<bool> isSelectedList = [];
  @override
  void updateColor(index) {
    isSelectedList = List<bool>.filled(languages.length, false);
    isSelectedList[index] = !isSelectedList[index];
    update();
  }
}
