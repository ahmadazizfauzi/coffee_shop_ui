import 'package:get/get.dart';

class DetailController extends GetxController {
  final RxBool isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
