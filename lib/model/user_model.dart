import 'package:expense_monitor_app/utils/app_constant.dart';

class UserModel {
  int? uid;
  String? email;
  String? name;
  String? password;
  String? createdAt;
  String ? mobileNo;
  String ? imageUrl;

  UserModel({
    this.uid, 
    this.email, 
    this.name,
    this.password, 
    this.createdAt,
    this.mobileNo, 
    this.imageUrl,
    });

// return map;

  Map<String, dynamic> toMap() {
    return {
      // AppConstant.columnUserId: uid,
      AppConstant.columnUserEmail: email,
      AppConstant.columnUserName: name,
      AppConstant.columnUserMobNo: mobileNo,
      AppConstant.columnUserCreatedAt: createdAt,
      AppConstant.columnUserPass:password,
      AppConstant.columnUserImageUrl: imageUrl
    };
  }
//  return model;

  factory UserModel.fromMap(Map<String, dynamic> mapData) {
    return UserModel(
      uid: mapData[AppConstant.columnUserId],
      email: mapData[AppConstant.columnUserEmail],
      name: mapData[AppConstant.columnUserName],
      createdAt: mapData[AppConstant.columnUserCreatedAt],
      // password: mapData[AppConstant.columnUserPass],
      mobileNo: mapData[AppConstant.columnUserMobNo],
      imageUrl: mapData[AppConstant.columnUserImageUrl]
    );
  }

}