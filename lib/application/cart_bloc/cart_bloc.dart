

import 'package:bloc_rest/application/cart_bloc/cart_event.dart';
import 'package:bloc_rest/application/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  
  CartBloc() : super(CartInitialState()) {
    on<CartAdd>((event, emit) async {
      state.cartProduct[event.productAdd] =
          (state.cartProduct[event.productAdd] ?? 0) + 1;

      emit(CartState(cartProduct: state.cartProduct));
    });


    on<CartRemove>((event, emit) async {

      state.cartProduct[event.productremoval]! <= 1
          ? state.cartProduct.remove(event.productremoval)
        
          :state.cartProduct[event.productremoval]= state.cartProduct[event.productremoval]! - 1;

        emit(CartState(cartProduct: state.cartProduct));
    });
  }
}



      
      // if (state.cartProduct.containsKey(event.productAdd)) {
      //   state.cartProduct[event.productAdd]! + 1;
      // } else {
      //   state.cartProduct[event.productAdd];
      // }