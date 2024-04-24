part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginUserEvent extends AuthenticationEvent{
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}
