part of 'user_bloc_bloc.dart';

@immutable
sealed class UserBlocState {}

final class UserBlocInitial extends UserBlocState {}
final class UserLoadingState extends UserBlocState {}
final class UserSuccessState extends UserBlocState {}
final class UserErrorState extends UserBlocState {
  final String errMessage;
  UserErrorState({required this.errMessage});

}


