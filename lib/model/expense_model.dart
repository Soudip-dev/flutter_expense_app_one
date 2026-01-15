

import 'package:expense_monitor_app/utils/app_constant.dart';

class ExpenseModel {
  int? id;
  int? userId;
  String title;
  String desc;
  num amt;
  num bal;
  int expType;
  ///1->Debit, 2->Credit
  int catId;
  int createdAt;

  ExpenseModel({
    this.id,
    this.userId,
    required this.title,
    required this.desc,
    required this.amt,
    required this.bal,
    required this.expType,
    required this.catId,
    required this.createdAt,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) => ExpenseModel(
    id: map[AppConstant.columnExpId],
    userId: map[AppConstant.columnUserId],
    title: map[AppConstant.columnExpTitle],
    desc: map[AppConstant.columnExpDesc],
    amt: map[AppConstant.columnExpAmt],
    bal: map[AppConstant.columnExpBal],
    expType: map[AppConstant.columnExpType],
    catId: map[AppConstant.columnExpCatId],
    createdAt: int.parse(map[AppConstant.columnExpCreatedAt]),
  );

  Map<String, dynamic> toMap() => {
    AppConstant.columnUserId: userId,
    AppConstant.columnExpTitle: title,
    AppConstant.columnExpDesc: desc,
    AppConstant.columnExpAmt: amt,
    AppConstant.columnExpBal: bal,
    AppConstant.columnExpType: expType,
    AppConstant.columnExpCatId: catId,
    AppConstant.columnExpCreatedAt: createdAt.toString(),
  };
}
