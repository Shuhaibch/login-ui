import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job/login_implementation.dart';
import 'package:job/user_model.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final user = await UserImplentation.getProductDetails(
            event.email, event.password);
        // log(user['message']);
        if (user['status'] == true) {
          emit(AuthenticationSuccess(user: user['data']));
        } else {
          emit(AuthenticationFailure());
        }
      } catch (e) {
        print(e);
        emit(AuthenticationFailure());
      }
    });
  }
}
    // final user = await UserImplentation.getProductDetails(
    //                         email.text, password.text);
    //                     if (user['message'] == "User logged in successfully") {
    //                       Navigator.of(context).push(MaterialPageRoute(
    //                         builder: (context) => HomeScreen(),
    //                       ));
    //                     } else {
    //                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //                           content: Text("Invalid email or password")));
    //                     }