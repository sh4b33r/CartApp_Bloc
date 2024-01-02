import 'package:bloc_rest/application/login_bloc/login_event.dart';
import 'package:bloc_rest/application/login_bloc/login_state.dart';
import 'package:bloc_rest/domain/api/api_calling.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LogininitialState()) {
    on<LoginButtonClicked>((event, emit) async {
      emit(LoginLoadingState());
    print(event.username);
    print(event.password);
      final loginval = await checkLogin(event.username, event.password);

      if (loginval==false) {
        emit(LoginfailedState(
            errorMessege: "Please Enter Valid Username and Password"));
      } else {
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccessState());
      }
    });
  }
}
