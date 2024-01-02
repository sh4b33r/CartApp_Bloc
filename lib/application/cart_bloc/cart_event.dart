import 'package:bloc_rest/domain/model/product_model.dart';

abstract class CartEvent {}

class CartAdd extends CartEvent {
  final ProductModel productAdd;

  CartAdd({required this.productAdd});
}

class CartRemove extends CartEvent {
  final ProductModel productremoval;

  CartRemove({required this.productremoval});
}
