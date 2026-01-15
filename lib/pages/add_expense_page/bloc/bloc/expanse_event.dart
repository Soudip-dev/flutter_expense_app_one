part of 'expanse_bloc.dart';

@immutable
sealed class ExpanseEvent {}

final class FetchExpanse extends ExpanseEvent {
  ///1->date wise
  ///2->month wise
  ///3->year wise
  ///4->cat wise
  int filterFlag;
  FetchExpanse({required this.filterFlag});
}

class AddExpanseEvent extends ExpanseEvent{
  final ExpenseModel expenseModel;

  AddExpanseEvent({required this.expenseModel});
}

class UpdateExpanseEvent extends ExpanseEvent{
  final ExpenseModel expenseModel;

  UpdateExpanseEvent({required this.expenseModel});
}

class DeleteExpanseEvent extends ExpanseEvent{
  final int id;

  DeleteExpanseEvent({required this.id});
}




