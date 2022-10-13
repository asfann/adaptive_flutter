import 'package:adaptive_flutter/data/requeest_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/user_repo.dart';
import '../registration_cubit/registration_cubit.dart';

part 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmState> {
  ConfirmCubit({
    required this.user
  }) : super(ConfirmStateLoading());
  final UserRepository user;


  Future<void> confirm(String code, String password, ) async{
    emit(ConfirmStateLoading());
    try{
     await user.confirmUser(password, code);
      emit(ConfirmStateSuccess());
    }on RequestException catch(e){
      emit(ConfirmStateFailure(exception: e));
    }
  }
}
