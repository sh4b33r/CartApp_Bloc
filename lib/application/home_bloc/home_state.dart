
import 'package:bloc_rest/domain/model/product_model.dart';

abstract class HomeState{}


class HomeInitialstate extends HomeState{}
class HomeOnLoadingstate extends HomeState{}

class HomeProductsLoadingState extends HomeState{
  final List<ProductModel> allProducts;

 HomeProductsLoadingState({required this.allProducts});
}


class HomefavoriteState extends HomeState{
 

}

class HomeProductfailedState extends HomeState{
 String error;

 HomeProductfailedState({required this.error});



}