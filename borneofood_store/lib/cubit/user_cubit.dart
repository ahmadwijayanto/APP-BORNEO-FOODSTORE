import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/user_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit() : super(UserInitial());

  Future<void> login(String email, String password) async{
    ApiReturnValue<User> result = await UserServices.login(email, password);
    if(result.value != null){
      emit(UserLoaded(result.value));
    }else{
      emit(UserLoadFailed(result.message));
    }
  }

}

class UserInitial extends UserState {
}

class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props =>[];
}

class UserLoaded extends UserState{
  final User user;

  UserLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class UserLoadFailed extends UserState{
  final String message;

  UserLoadFailed(this.message);
  @override
  List<Object> get props => [message];
}