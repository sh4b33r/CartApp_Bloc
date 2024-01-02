import 'package:bloc_rest/application/home_cubit/home_bloc.dart';
import 'package:bloc_rest/application/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/cart_bloc/cart_bloc.dart';
import 'presentation/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyLoginPage(),
        ),
      ),
    );
  }
}
