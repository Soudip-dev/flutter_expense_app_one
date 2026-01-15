import 'package:expense_monitor_app/model/category_model.dart';

class AppConstant {
  ///imgPath
  static const String imgCoffee = "assets/icons/coffee.png";
  static const String imgFastFood = "assets/icons/fast-food.png";
  static const String imgTravel = "assets/icons/travel.png";
  static const String imgSnack = "assets/icons/snack.png";
  static const String imgShopping = "assets/icons/shopping-bag.png";
  static const String imgMovie = "assets/icons/popcorn.png";
  static const String imgRestaurant = "assets/icons/restaurant.png";
  static const String imgAppLogo = "assets/icons/ic_app_logo.png";
  static const String imgAppLogoSolid = "assets/icons/ic_app_logo_solid.png";
  static const String imgAppLogoOutlineBlack = "assets/icons/ic_app_logo_outline.png";


  static const String prefUserId = "pref_user_id";


  
  static const String dbName = "expensDb.db";
  static const String expTable = "expense";
  ///columns
  
  static const String columnExpId = "e_id";
  static const String columnExpTitle = "e_title";
  static const String columnExpDesc = "e_desc";
  static const String columnExpAmt = "e_amt";
  static const String columnExpBal = "e_bal";
  static const String columnExpType = "e_type";
  static const String columnExpCatId = "e_cat_id";
  static const String columnExpCreatedAt = "e_created_at";

  
  ///columns
  static const String userTable = "user";
  static const String columnUserId = "u_id";
  static const String columnUserName = "u_name";
  static const String columnUserEmail = "u_email";
  static const String columnUserMobNo = "u_mob_no";
  static const String columnUserPass = "u_pass";
  static const String columnUserImageUrl = "u_img";
  static const String columnUserCreatedAt = "u_created_at";

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

   static List <String> timeList = ["Daily","Weekly","Monthly","Yearly"];
  static List <String> dbCr = ["Debit","Credit"];


  static List <CategoryModel> categoryList = [
    CategoryModel(categoryId: 1, categoryName: "Coffee", categoryImage: AppConstant.imgCoffee),
    CategoryModel(categoryId: 2, categoryName: "Fast Food", categoryImage: AppConstant.imgFastFood),
    CategoryModel(categoryId: 3, categoryName: "Travel", categoryImage: AppConstant.imgTravel),
    CategoryModel(categoryId: 4, categoryName: "Snack", categoryImage: AppConstant.imgSnack),
    CategoryModel(categoryId: 5, categoryName: "Shopping", categoryImage: AppConstant.imgShopping),
    CategoryModel(categoryId: 6, categoryName: "Movie", categoryImage: AppConstant.imgMovie),
    CategoryModel(categoryId: 7, categoryName: "Restaurant", categoryImage: AppConstant.imgRestaurant),
  ];


}