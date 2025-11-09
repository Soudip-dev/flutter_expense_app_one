import 'package:bloc/bloc.dart';
import 'package:expense_monitor_app/db/local_db/db_helper.dart';
import 'package:expense_monitor_app/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  DbHelper dbHelper ;
  UserBlocBloc( {required this.dbHelper}) : super(UserBlocInitial()) {

    on<AddUserEvent>((event, emit) async {
       emit(UserLoadingState());
       int check =await dbHelper.createUser(newUser: event.mUser)  ;
       
      
      if(check==3){
        emit(UserSuccessState());
      } else if(check==2){
        emit(UserErrorState(errMessage: "User already exists"));
      } else {
        emit(UserErrorState(errMessage: "Something went wrong"));
      }

       
    });


    on<LoginUserEvent>((event, emit) async{
      emit(UserLoadingState());
      int check =await dbHelper.login(event.userEmail, event.userPassword);
      if(check == 1){
        emit(UserSuccessState());
      } else if (check == 3) {
        emit(UserErrorState(errMessage: "Password Incorrect."));
      } else {
        emit(UserErrorState(errMessage: "Email Invalid."));
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
