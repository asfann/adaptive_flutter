part of 'confirm_cubit.dart';

@immutable
abstract class ConfirmState extends Equatable {
  const ConfirmState();
}

class ConfirmStateLoading extends ConfirmState {
  @override
  List<Object> get props => [];
}

class ConfirmStateSuccess extends ConfirmState {


  @override
  List<Object> get props => [];
}

class ConfirmStateFailure extends ConfirmState {
  final RequestException exception;

   ConfirmStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}

