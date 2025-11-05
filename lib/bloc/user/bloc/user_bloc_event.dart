part of 'user_bloc_bloc.dart';

@immutable
sealed class UserBlocEvent {}

final class AddUserEvent extends UserBlocEvent {
  final UserModel mUser;

  AddUserEvent({
    required this.mUser,
  });
}

final class LoginUserEvent extends UserBlocEvent {
  final String userEmail;
  final String userPassword;

  LoginUserEvent({required this.userEmail, required this.userPassword});
}

final class GetUserDataEvent extends UserBlocEvent {
  final String userEmail;

  GetUserDataEvent({required this.userEmail});
}

final class UpdateUserEvent extends UserBlocEvent {
  final UserModel mUser;

  UpdateUserEvent({
    required this.mUser,
  
  });
}

final class DeleteUserEvent extends UserBlocEvent {
  final int userId;

  DeleteUserEvent({required this.userId});
}



