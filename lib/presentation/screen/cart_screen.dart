import 'package:bloc_rest/application/cart_bloc/cart_bloc.dart';
import 'package:bloc_rest/application/cart_bloc/cart_event.dart';
import 'package:bloc_rest/application/cart_bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget{
   const CartScreen({super.key});
    
  @override
  Widget build(BuildContext context) {
 
  return Scaffold(
  appBar: AppBar(title:   const Text("Cart Products")),
  body: BlocBuilder<CartBloc,CartState>(

     
    builder: (context, state) {
// ===============================
//       for(var element in state.cartProduct.keys){
//       procount.add(state.cartProduct[element]);
//       proname.add(element.title);
//       }
// ===============================
   return  SingleChildScrollView(
   
     child: Column(
       children: state.cartProduct.keys.map((element) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 252, 246, 227),),
          child: Row(
            children: [
              Image.network(element.image, height: 60, width: 50,),
              element.title.length > 20 ?
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(element.title.substring(0, 20)),
              ) :
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(element.title),
              ),
            
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                          onPressed: () {
                            context.read<CartBloc>().add(CartRemove(productremoval: element));
                          },
                          child: const Icon(Icons.minimize),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(state.cartProduct[element].toString()),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                          onPressed: () {
                            context.read<CartBloc>().add(CartAdd(productAdd: element));
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
       }).toList(),
     ),
   );

        },
      ),
    );
    }

  }
 



