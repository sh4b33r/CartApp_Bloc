import 'package:bloc_rest/application/login_bloc/login_bloc.dart';
import 'package:bloc_rest/application/login_bloc/login_event.dart';
import 'package:bloc_rest/application/login_bloc/login_state.dart';
import 'package:bloc_rest/presentation/screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLoginPage extends StatelessWidget {
  MyLoginPage({super.key});

  final TextEditingController usrnamecont = TextEditingController();
  final TextEditingController passcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
          if(state is LoginfailedState){
            ScaffoldMessenger.of(context).showSnackBar(
              
              SnackBar(
                 behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
                content: Text(state.errorMessege)));
          }
        if (state is LoginSuccessState) {
                         

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (ctx) => const HomeScreen()),
                            (route) => false);


                             ScaffoldMessenger.of(context).showSnackBar(
              
              const SnackBar(
                duration: Duration(seconds: 2),
                 behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
                content: Text("Login Successful")));

                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (ctx) => const HomeScreen()));
                      }
      },
      builder: (context, state) {
        
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state is LoginfailedState
                ? Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          state.errorMessege,
                          style: const TextStyle(color: Colors.red),
                        )),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Username", border: OutlineInputBorder()),
                controller: usrnamecont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passcont,
                decoration: const InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
            ),
      

   
            Center(
              child: SizedBox(
                width: 110,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(width: .1)),
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginButtonClicked(
                              username: usrnamecont.text,
                              password: passcont.text));

                    
                      // context.read<LoginBloc>().add(LoginButtonClicked(username: usrnamecont.text, password: passcont.text));
                      // add(LoginButtonClicked(username: usrnamecont.text, password: passcont.text));
                    },
                    child: state is LoginLoadingState
                        ? const CircularProgressIndicator()
                        : const Text("Submit")),
              ),
            )
          ],
        );
      },
    ));
  }
}
