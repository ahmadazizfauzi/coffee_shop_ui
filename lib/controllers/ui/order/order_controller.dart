import 'package:get/get.dart';
import 'package:coffee/model/data/data_coffee.dart';

class OrderController extends GetxController {
  final Coffee coffee;
  RxInt quantity = 1.obs;

  OrderController({required this.coffee});

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity--;
    }
  }
}
