import 'package:bloc/bloc.dart';
import 'package:expense_monitor_app/db/local_db/db_helper.dart';
import 'package:expense_monitor_app/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  DbHelper dbHelper ;
  UserBlocBloc( {required this.dbHelper}) : super(UserBlocInitial()) {
    on<AddUserEvent>((event, emit) {
       emit(UserLoadingState());
       int check = dbHelper.createUser(newUser: event.mUser) as int;
      
      if(check==3){
        emit(UserSuccessState());
      } else if(check==2){
        emit(UserErrorState(errMessage: "User already exists"));
      } else {
        emit(UserErrorState(errMessage: "Something went wrong"));
      }

       
    });


    on<LoginUserEvent>((event, emit) {
      emit(UserLoadingState());
      bool check = dbHelper.login(event.userEmail, event.userPassword) as bool;
      if(check){
        emit(UserSuccessState());
      } else {
        emit(UserErrorState(errMessage: "Invalid email or password"));
      }
      
    },);
    on<GetUserDataEvent>((event, emit) {
      emit(UserLoadingState());
      UserModel check = dbHelper.getUserData(event.userEmail) as UserModel;
      emit(UserSuccessState());
      
    },);
    on<UpdateUserEvent>((event, emit) {
      emit(UserLoadingState());
      bool check = dbHelper.editAccount(event.mUser) as bool;
      if(check){
        emit(UserSuccessState());
      }
      
    },);
    on<DeleteUserEvent>((event, emit) {
      emit(UserLoadingState());
      bool check = dbHelper.deleteAccount(event.userId) as bool;
      if(check){
        emit(UserSuccessState());
      }
      
    },);
  }
}
