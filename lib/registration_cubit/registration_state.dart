part of 'registration_cubit.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class RegistrationStateLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationStateSuccess extends RegistrationState {
  final String password;
  final String email;
  const RegistrationStateSuccess({
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [];
}

class RegistrationStateFailure extends RegistrationState {
  final RequestException exception;

  const RegistrationStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}

