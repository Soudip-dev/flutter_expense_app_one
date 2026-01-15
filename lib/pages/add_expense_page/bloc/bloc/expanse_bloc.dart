import 'package:bloc/bloc.dart';
import 'package:expense_monitor_app/db/local_db/db_helper.dart';
import 'package:expense_monitor_app/model/category_model.dart';
import 'package:expense_monitor_app/model/expense_model.dart';
import 'package:expense_monitor_app/model/filter_expense_model.dart';
import 'package:expense_monitor_app/utils/app_constant.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'expanse_event.dart';
part 'expanse_state.dart';

class ExpanseBloc extends Bloc<ExpanseEvent, ExpanseState> {
  DbHelper dbHelper;
  ExpanseBloc({required this.dbHelper}) : super(ExpanseInitial()) {

    
    on<AddExpanseEvent>((event, emit) async {

      emit(ExpanseLoading());
      bool check = await dbHelper.addExpense(newExpense: event.expenseModel);
      if(check){
        var allExp = await dbHelper.getAllExpenses();
        
        emit(ExpanseLoaded(successMessage: "Expense Added Successfully", allExp: filterAllExp(allExp, 1)));
      }else{
        emit(ExpanseError(errorMessage: "Something went wrong"));
      }
     
    });

 

    on<FetchExpanse>((event, emit){
       if(state is ExpanseLoading){
        emit(ExpanseLoading());
       } 

    });
  }
     
  List<FilterExpenseModel> filterAllExp(
    List<ExpenseModel> allExpenses,
    int flag,
  ) {
    List<FilterExpenseModel> filteredExpenses = [];

    ///filter == 1
    ///date wise
    if(flag<4) {
      DateFormat df = DateFormat.y();
      if(flag==1) {
        df = DateFormat.yMMMMd();
      } else if(flag==2){
        df = DateFormat.yMMMM();
      }

      ///uniqueDate
      List<String> uniqueDates = [];

      for (ExpenseModel eachExp in allExpenses) {
        String eachDate = df.format(
          DateTime.fromMillisecondsSinceEpoch(eachExp.createdAt),
        );
        if (!uniqueDates.contains(eachDate)) {
          uniqueDates.add(eachDate);
        }
      }

      for (String eachUniqueDate in uniqueDates) {
        num totalExp = 0.0;
        List<ExpenseModel> eachDateExp = [];

        for (ExpenseModel eachExp in allExpenses) {
          String eachDate = df.format(
            DateTime.fromMillisecondsSinceEpoch(eachExp.createdAt),
          );

          if (eachUniqueDate == eachDate) {
            eachDateExp.add(eachExp);

            if (eachExp.expType == 1) {
              totalExp -= eachExp.amt;
            } else {
              totalExp += eachExp.amt;
            }
          }
        }

        filteredExpenses.add(
          FilterExpenseModel(
            title: eachUniqueDate,
            balance: totalExp,
            eachTitleExp: eachDateExp,
          ),
        );
      }
    }
    else {
      ///cat wise
      List<CategoryModel> uniqueCats = AppConstant.categoryList;

      for(CategoryModel eachCat in uniqueCats){
        num totalExp = 0.0;
        List<ExpenseModel> eachDateExp = [];

        for(ExpenseModel eachExp in allExpenses){
          if(eachExp.catId==eachCat.categoryId){
            eachDateExp.add(eachExp);

            if (eachExp.expType == 1) {
              totalExp -= eachExp.amt;
            } else {
              totalExp += eachExp.amt;
            }
          }
        }

        filteredExpenses.add(
          FilterExpenseModel(
            title: eachCat.categoryName!,
            balance: totalExp,
            eachTitleExp: eachDateExp,
          ),
        );
      }
    }

    return filteredExpenses;
  }

}
