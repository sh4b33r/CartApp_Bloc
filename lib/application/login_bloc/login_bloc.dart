import 'package:bloc_rest/application/login_bloc/login_event.dart';
import 'package:bloc_rest/application/login_bloc/login_state.dart';
import 'package:bloc_rest/domain/api/api_calling.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LogininitialState()) {
    on<LoginButtonClicked>((event, emit) async {
      emit(LoginLoadingState());
  
      final loginval = await checkLogin(event.username, event.password);

      if (!loginval) {
        emit(LoginfailedState(
            errorMessege: "Please Enter Valid Username and Password"));
      } else {
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccessState());
      }
    });
  }
}


// on<LoginButtonClicked>((event, emit) async {
//       emit(LoginLoadingState());
//       var val= await loginChecking(event.email,event.password);
//       if(val){
//         emit(LoginSuccessState());
//       }
//       else{
//         emit(LoginErrorState(error: 'Invalid user name or password'));
//       }