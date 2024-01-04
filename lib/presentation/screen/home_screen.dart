import 'package:bloc_rest/application/cart_bloc/cart_bloc.dart';
import 'package:bloc_rest/application/cart_bloc/cart_event.dart';
import 'package:bloc_rest/application/cart_bloc/cart_state.dart';

import 'package:bloc_rest/application/home_cubit/home_bloc.dart';
import 'package:bloc_rest/application/home_cubit/home_state.dart';
import 'package:bloc_rest/presentation/screen/cart_screen.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            SizedBox(
              width: 35,
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const CartScreen()));
                        },
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 25,
                        ),
                      ),
                      Positioned(
                          left: 13,
                          bottom: 9.55,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 8,
                            child: state.cartProduct.isEmpty
                                ? const Text("0", style: TextStyle(fontSize: 9))
                                : Text(state.cartProduct.length.toString(),
                                    style: const TextStyle(fontSize: 9)),
                          )),
                    ],
                  );
                },
              ),
            )
          ],
          title: const Text("Shopify"),
          backgroundColor: const Color.fromARGB(255, 103, 207, 217)),
      body: Column(children: [
        Expanded(child:
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state1) {
          return state1 is HomeProductsLoadedState
              ? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(state1.allProducts.length, (index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.network(state1.allProducts[index].image,
                                    height: 60, width: 40, scale: 1.0),
                                state1.allProducts[index].title.length > 20
                                    ? Text(
                                        state1.allProducts[index].title
                                            .substring(0, 20),
                                        style: const TextStyle(fontSize: 13),
                                      )
                                    : Text(state1.allProducts[index].title,
                                        style: const TextStyle(fontSize: 13)),
                                Text(
                                  "₹${state1.allProducts[index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(CartAdd(
                                                  productAdd: state1
                                                      .allProducts[index]));

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  duration:
                                                      const Duration(seconds: 2),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      " Added ${state1.allProducts[index].title.substring(0, 15)} to cart ")));

                                          //  context.read<CartBloc>().add(CartAdd(productAdd: state.allProducts[index]));
                                        },
                                        child: const Row(
                                          children: [
                                            Text("Cart"),
                                            Icon(Icons.shopping_cart),
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            )));
                  }),
                )
              :  CardLoading(
                height: 700,
                child: Column(
                  children: [
                    Row(children: [
                      
                      Container(),
                    
                    
                    ],),

                    Container()
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                margin: EdgeInsets.only(bottom: 10),
              );
        }))
      ]),
    );
  }
}
