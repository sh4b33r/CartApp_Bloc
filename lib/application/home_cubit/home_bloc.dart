import 'package:bloc_rest/application/home_cubit/home_state.dart';
import 'package:bloc_rest/domain/api/api_calling.dart';
import 'package:bloc_rest/domain/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
 HomeCubit():super(HomeInitialstate()){


  
  emit(HomeOnLoadingstate());
  fecthAndEmit();
 }
   
 fecthAndEmit() async{
  List<ProductModel> products= await fetchfromApi();
  emit(HomeProductsLoadingState(allProducts: products));

 }

 


  
 



}


