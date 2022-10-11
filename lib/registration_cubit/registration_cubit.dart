import 'package:adaptive_flutter/data/requeest_exception.dart';
import 'package:adaptive_flutter/data/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/secure_storage_client.dart';


part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({
    required this.user
  }) : super(RegistrationStateLoading());
  final UserRepository user;


  Future<void> register(String username, String identificator, String password) async{
    emit(RegistrationStateLoading());
    try{
      final String token = await user.registrationUser(username, identificator, password);
      SharedPreferencesRepository().setToken(token);
      emit(RegistrationStateSuccess(password: password, email: identificator));
    }on RequestException catch(e){
      emit(RegistrationStateFailure(exception: e));
    }
  }
}
