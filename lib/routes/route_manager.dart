import 'package:flutter/material.dart';
import 'package:whatsup1to1/app/seller/seller_home.dart';
import 'package:whatsup1to1/app/user_auth/views/seller_account_under_review.dart';
import 'package:whatsup1to1/app/user_auth/views/seller_main_store_address.dart';
import 'package:whatsup1to1/app/user_auth/views/seller_select_type_screen.dart';
import 'package:whatsup1to1/app/user_auth/views/user_forget_pass_screen.dart';
import 'package:whatsup1to1/app/user_auth/views/user_login_screen.dart';
import 'package:whatsup1to1/app/user_auth/views/user_otp_screen.dart';
import 'package:whatsup1to1/app/user_auth/views/user_reset_pass_screen.dart';
import 'package:whatsup1to1/app/user_on_boarding/views/user_on_boarding_screen1.dart';
import 'package:whatsup1to1/app/user_on_boarding/views/user_on_boarding_screen2.dart';
import '../app/user/user_home.dart';
import '../app/user_auth/views/seller_select_category_screen.dart';
import '../app/user_auth/views/user_account_type_screen.dart';
import '../app/user_auth/views/user_signup_screen.dart';
import '../app/user_on_boarding/views/user_on_boarding_screen3.dart';
import 'navigation.dart';

class AppRoutes {
//Common Portion
  static const String userOnBoardingScreen1 = '/userOnBoardingScreen1';
  static const String userOnBoardingScreen2 = '/userOnBoardingScreen2';
  static const String userOnBoardingScreen3 = '/userOnBoardingScreen3';
  static const String userLoginScreen = '/userLogin';
  static const String userSignupScreen = '/userSignup';
  static const String userAccountTypeScreen = '/userAccountType';
  static const String userForgetPassScreen = '/userForgetPass';
  static const String userResetPassScreen = '/userResetPass';
  static const String userOTPScreen = '/userOTPScreen';
  static const String userMainMenu = '/userMainMenu';
  static const String sellerMainMenu = '/sellerMainMenu';
  static const String sellerSelectTypeScreen = '/sellerSelectTypeScreen';
  static const String sellerSelectCategoryScreen =
      '/sellerSelectCategoryScreen';
  static const String sellerMainStoreAddressScreen =
      '/sellerMainStoreAddressScreen';
  static const String sellerAccountUnderReviewScreen =
      '/sellerAccountUnderReviewScreen';

  static const String adminMainMenu = '/AdminMainMenu';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userMainMenu:
        return _buildNormalRoute(const UserHome());
      case userOnBoardingScreen1:
        return _buildRoute(const UserOnBoardingScreen1());
      case userOnBoardingScreen2:
        return _buildRoute(const UserOnBoardingScreen2());
      case userOnBoardingScreen3:
        return _buildRoute(const UserOnBoardingScreen3());
      case userLoginScreen:
        return _buildRoute(const UserLoginScreen());
      case userSignupScreen:
        return _buildRoute(const UserSignUpScreen());
      case userAccountTypeScreen:
        return _buildRoute(const UserAccountTypeScreen());
      case userForgetPassScreen:
        return _buildRoute(const UserForgetPassScreen());
      case userResetPassScreen:
        return _buildRoute(const UserResetPassScreen());
      case userOTPScreen:
        return _buildRoute(const UserOTPScreen());






      case sellerMainMenu:
        return _buildNormalRoute(const SellerHome());
      case sellerSelectTypeScreen:
        return _buildNormalRoute(const SellerSelectTypeScreen());
      case sellerSelectCategoryScreen:
        return _buildNormalRoute(const SellerSelectCategoryScreen());
      case sellerMainStoreAddressScreen:
        return _buildRoute(const SellerMainStoreAddress());
      case sellerAccountUnderReviewScreen:
        return _buildRoute(const SellerAccountUnderReviewScreen());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => const UserLoginScreen());
  }

  static _buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }

  static buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }

  static _buildNormalRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
