import 'package:bloc_rest/domain/model/product_model.dart';

class CartState{
  final Map<ProductModel,int> cartProduct;
  
CartState({required this.cartProduct});
} 

class CartInitialState extends CartState{
 CartInitialState() : super(cartProduct: {});
}

class CartOnLoading extends CartState{
  CartOnLoading({required super.cartProduct});
}

























// import 'package:main_project/domain/model/product_model.dart';

// class CartState {
 
// }

// class InitialCartState extends CartState{
//   InitialCartState() : super(cartProduct: {});
  