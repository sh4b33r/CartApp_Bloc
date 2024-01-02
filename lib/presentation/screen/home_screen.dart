import 'package:bloc_rest/application/cart_bloc/cart_bloc.dart';
import 'package:bloc_rest/application/cart_bloc/cart_event.dart';
import 'package:bloc_rest/application/cart_bloc/cart_state.dart';
import 'package:bloc_rest/application/home_cubit/home_bloc.dart';
import 'package:bloc_rest/application/home_cubit/home_state.dart';
import 'package:bloc_rest/presentation/screen/cart_screen.dart';
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
        Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return state is HomeProductsLoadingState
              ? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(state.allProducts.length, (index) {
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
                                Image.network(state.allProducts[index].image,
                                    height: 60, width: 40, scale: 1.0),
                                state.allProducts[index].title.length > 20
                                    ? Text(
                                        state.allProducts[index].title
                                            .substring(0, 20),
                                        style: const TextStyle(fontSize: 13),
                                      )
                                    : Text(state.allProducts[index].title,
                                        style: const TextStyle(fontSize: 13)),
                                Text(
                                  "₹${state.allProducts[index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(CartAdd(
                                                  productAdd: state
                                                      .allProducts[index]));
                                        //  context.read<CartBloc>().add(CartAdd(productAdd: state.allProducts[index]));
                                        },
                                        child: const Row(
                                          children: [
                                            Text("Cart"),
                                            Icon(Icons.shopping_cart),
                                          ],
                                        )),
                                    BlocBuilder<HomeCubit, HomeState>(
                                      builder: (context, state) {
                                        return      IconButton(
                                            onPressed: () {
                                             
                                            },
                                            icon: 
                                                                    
                                            const Icon(
                                                Icons.favorite_outline));
                                      },
                                    )
                                  ],
                                )
                              ],
                            )));
                  }),
                )
              : const Center(child: CircularProgressIndicator());
        }))
      ]),
    );
  }
}
