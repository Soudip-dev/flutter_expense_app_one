part of 'expanse_bloc.dart';

@immutable
sealed class ExpanseState {}

final class ExpanseInitial extends ExpanseState {
  
}
final class ExpanseLoading extends ExpanseState {}
final class ExpanseLoaded extends ExpanseState{
  final String successMessage;
  final List<FilterExpenseModel> allExp;

  ExpanseLoaded({
    required this.successMessage,
    required this.allExp,
    });

}
final class ExpanseError extends ExpanseState{
  final String errorMessage;

  ExpanseError({required this.errorMessage});

}

