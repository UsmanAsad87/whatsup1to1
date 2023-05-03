// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get SKIP {
    return Intl.message(
      'SKIP',
      name: 'SKIP',
      desc: '',
      args: [],
    );
  }

  /// `Start Shopping`
  String get Start_Shopping {
    return Intl.message(
      'Start Shopping',
      name: 'Start_Shopping',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get Already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'Already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get Sign_In {
    return Intl.message(
      'Sign In',
      name: 'Sign_In',
      desc: '',
      args: [],
    );
  }

  /// `Hey,`
  String get Hey {
    return Intl.message(
      'Hey,',
      name: 'Hey',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get Login_Now {
    return Intl.message(
      'Login Now',
      name: 'Login_Now',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get Forgot_Password {
    return Intl.message(
      'Forgot Password ?',
      name: 'Forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get SIGN_IN_button {
    return Intl.message(
      'SIGN IN',
      name: 'SIGN_IN_button',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get Or_sign_in_with {
    return Intl.message(
      'Or sign in with',
      name: 'Or_sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `If you are new,`
  String get If_you_are_new {
    return Intl.message(
      'If you are new,',
      name: 'If_you_are_new',
      desc: '',
      args: [],
    );
  }

  /// `Create Now`
  String get Create_Now {
    return Intl.message(
      'Create Now',
      name: 'Create_Now',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up_title {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up_title',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get SIGN_UP_button {
    return Intl.message(
      'SIGN UP',
      name: 'SIGN_UP_button',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get Or_sign_up_with {
    return Intl.message(
      'Or sign up with',
      name: 'Or_sign_up_with',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get sellerName {
    return Intl.message(
      'Seller',
      name: 'sellerName',
      desc: '',
      args: [],
    );
  }

  /// `Watches`
  String get itemName {
    return Intl.message(
      'Watches',
      name: 'itemName',
      desc: '',
      args: [],
    );
  }

  /// `Move to wishlist`
  String get moveToWish {
    return Intl.message(
      'Move to wishlist',
      name: 'moveToWish',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get coupons {
    return Intl.message(
      'Coupons',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupons`
  String get applyCoupons {
    return Intl.message(
      'Apply Coupons',
      name: 'applyCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Rewards`
  String get rewards {
    return Intl.message(
      'Rewards',
      name: 'rewards',
      desc: '',
      args: [],
    );
  }

  /// `Use Referral Balance`
  String get useReferralBalance {
    return Intl.message(
      'Use Referral Balance',
      name: 'useReferralBalance',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cart Total`
  String get cartTotal {
    return Intl.message(
      'Cart Total',
      name: 'cartTotal',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Discount`
  String get couponDiscount {
    return Intl.message(
      'Coupon Discount',
      name: 'couponDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Reward`
  String get reward {
    return Intl.message(
      'Reward',
      name: 'reward',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message(
      'Place Order',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get cartItemSize {
    return Intl.message(
      'Size',
      name: 'cartItemSize',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get page {
    return Intl.message(
      'Page',
      name: 'page',
      desc: '',
      args: [],
    );
  }

  /// `Start shopping`
  String get startShopping {
    return Intl.message(
      'Start shopping',
      name: 'startShopping',
      desc: '',
      args: [],
    );
  }

  /// `Whoops !! Cart is Empty`
  String get emptyCart {
    return Intl.message(
      'Whoops !! Cart is Empty',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven’t added anything to your cart yet. You will find a lot of interesting products on our “Shop” page`
  String get emptyCartDescription {
    return Intl.message(
      'Looks like you haven’t added anything to your cart yet. You will find a lot of interesting products on our “Shop” page',
      name: 'emptyCartDescription',
      desc: '',
      args: [],
    );
  }

  /// `Select Account Type`
  String get Select_Account_Type {
    return Intl.message(
      'Select Account Type',
      name: 'Select_Account_Type',
      desc: '',
      args: [],
    );
  }

  /// `Account Type`
  String get Account_Type {
    return Intl.message(
      'Account Type',
      name: 'Account_Type',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get Proceed {
    return Intl.message(
      'Proceed',
      name: 'Proceed',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get seller {
    return Intl.message(
      'Seller',
      name: 'seller',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message(
      'Customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `SEND OTP`
  String get Send_otp {
    return Intl.message(
      'SEND OTP',
      name: 'Send_otp',
      desc: '',
      args: [],
    );
  }

  /// `Back to`
  String get Back_to {
    return Intl.message(
      'Back to',
      name: 'Back_to',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get Reset_Password {
    return Intl.message(
      'Reset Password',
      name: 'Reset_Password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get Current_Password {
    return Intl.message(
      'Current Password',
      name: 'Current_Password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_Password {
    return Intl.message(
      'New Password',
      name: 'New_Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Confirm_Password {
    return Intl.message(
      'Confirm Password',
      name: 'Confirm_Password',
      desc: '',
      args: [],
    );
  }

  /// `RESET PASSWORD`
  String get RESET_btn {
    return Intl.message(
      'RESET PASSWORD',
      name: 'RESET_btn',
      desc: '',
      args: [],
    );
  }

  /// `Code Verification`
  String get Code_Verification {
    return Intl.message(
      'Code Verification',
      name: 'Code_Verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter your verification code here:`
  String get Enter_your_verification_code_here {
    return Intl.message(
      'Enter your verification code here:',
      name: 'Enter_your_verification_code_here',
      desc: '',
      args: [],
    );
  }

  /// `Don’t get code?`
  String get Dont_get_code {
    return Intl.message(
      'Don’t get code?',
      name: 'Dont_get_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `DONE`
  String get DONE {
    return Intl.message(
      'DONE',
      name: 'DONE',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Services {
    return Intl.message(
      'Services',
      name: 'Services',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get See_All {
    return Intl.message(
      'See All',
      name: 'See_All',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get Products {
    return Intl.message(
      'Products',
      name: 'Products',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Product Categories`
  String get Product_Categories {
    return Intl.message(
      'Product Categories',
      name: 'Product_Categories',
      desc: '',
      args: [],
    );
  }

  /// `Service Categories`
  String get Service_Categories {
    return Intl.message(
      'Service Categories',
      name: 'Service_Categories',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `See Profile`
  String get See_Profile {
    return Intl.message(
      'See Profile',
      name: 'See_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get Product_Details {
    return Intl.message(
      'Product Details',
      name: 'Product_Details',
      desc: '',
      args: [],
    );
  }

  /// `Service Details`
  String get Service_Details {
    return Intl.message(
      'Service Details',
      name: 'Service_Details',
      desc: '',
      args: [],
    );
  }

  /// `Customer Review`
  String get Customer_Review {
    return Intl.message(
      'Customer Review',
      name: 'Customer_Review',
      desc: '',
      args: [],
    );
  }

  /// `Review All`
  String get Review_All {
    return Intl.message(
      'Review All',
      name: 'Review_All',
      desc: '',
      args: [],
    );
  }

  /// `WISHLIST`
  String get WISHLIST {
    return Intl.message(
      'WISHLIST',
      name: 'WISHLIST',
      desc: '',
      args: [],
    );
  }

  /// `ADD TO CART`
  String get ADD_TO_CART {
    return Intl.message(
      'ADD TO CART',
      name: 'ADD_TO_CART',
      desc: '',
      args: [],
    );
  }

  /// `Published Products`
  String get Published_Products {
    return Intl.message(
      'Published Products',
      name: 'Published_Products',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get Filters {
    return Intl.message(
      'Filters',
      name: 'Filters',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get Reset {
    return Intl.message(
      'Reset',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filter`
  String get Apply_Filter {
    return Intl.message(
      'Apply Filter',
      name: 'Apply_Filter',
      desc: '',
      args: [],
    );
  }

  /// `Available Balance`
  String get Available_Balance {
    return Intl.message(
      'Available Balance',
      name: 'Available_Balance',
      desc: '',
      args: [],
    );
  }

  /// `$5 rewards`
  String get rewards5 {
    return Intl.message(
      '£5 rewards',
      name: 'rewards5',
      desc: '',
      args: [],
    );
  }

  /// `for every 60 pts`
  String get for_every_60_pts {
    return Intl.message(
      'for every 60 pts',
      name: 'for_every_60_pts',
      desc: '',
      args: [],
    );
  }

  /// `Redeem`
  String get Redeem {
    return Intl.message(
      'Redeem',
      name: 'Redeem',
      desc: '',
      args: [],
    );
  }

  /// `Earn Points`
  String get Earn_Points {
    return Intl.message(
      'Earn Points',
      name: 'Earn_Points',
      desc: '',
      args: [],
    );
  }

  /// `Referring to friends`
  String get Referring_to_friends {
    return Intl.message(
      'Referring to friends',
      name: 'Referring_to_friends',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Offers, Top Deals, Top Brands`
  String get Home_sub {
    return Intl.message(
      'Offers, Top Deals, Top Brands',
      name: 'Home_sub',
      desc: '',
      args: [],
    );
  }

  /// `Shop by Category`
  String get Shop_by_Category {
    return Intl.message(
      'Shop by Category',
      name: 'Shop_by_Category',
      desc: '',
      args: [],
    );
  }

  /// `Electronics, Appliances, Medical`
  String get Shop_by_Category_sub {
    return Intl.message(
      'Electronics, Appliances, Medical',
      name: 'Shop_by_Category_sub',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Orders, Recent Orders..`
  String get Orders_sub {
    return Intl.message(
      'Ongoing Orders, Recent Orders..',
      name: 'Orders_sub',
      desc: '',
      args: [],
    );
  }

  /// `Your Wishlist`
  String get Your_Wishlist {
    return Intl.message(
      'Your Wishlist',
      name: 'Your_Wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Your Save Products`
  String get Your_Wishlist_sub {
    return Intl.message(
      'Your Save Products',
      name: 'Your_Wishlist_sub',
      desc: '',
      args: [],
    );
  }

  /// `Your Account`
  String get Your_Account {
    return Intl.message(
      'Your Account',
      name: 'Your_Account',
      desc: '',
      args: [],
    );
  }

  /// `Profile, Settings, Saved Cards...`
  String get Your_Account_sub {
    return Intl.message(
      'Profile, Settings, Saved Cards...',
      name: 'Your_Account_sub',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Select your Language here..`
  String get Language_sub {
    return Intl.message(
      'Select your Language here..',
      name: 'Language_sub',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `Offers, Order tracking messages..`
  String get Notification_sub {
    return Intl.message(
      'Offers, Order tracking messages..',
      name: 'Notification_sub',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get About_us {
    return Intl.message(
      'About us',
      name: 'About_us',
      desc: '',
      args: [],
    );
  }

  /// `About Mit-Ghamr`
  String get About_us_sub {
    return Intl.message(
      'About Mit-Ghamr',
      name: 'About_us_sub',
      desc: '',
      args: [],
    );
  }

  /// `Help/Customer Care`
  String get Help_Customer_Care {
    return Intl.message(
      'Help/Customer Care',
      name: 'Help_Customer_Care',
      desc: '',
      args: [],
    );
  }

  /// `Customer Support, FAQs`
  String get Help_Customer_Care_sub {
    return Intl.message(
      'Customer Support, FAQs',
      name: 'Help_Customer_Care_sub',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing Orders, Recent Orders..`
  String get Ongoing_Orders_Recent_Orders {
    return Intl.message(
      'Ongoing Orders, Recent Orders..',
      name: 'Ongoing_Orders_Recent_Orders',
      desc: '',
      args: [],
    );
  }

  /// `Saved Addresses`
  String get Saved_Addresses {
    return Intl.message(
      'Saved Addresses',
      name: 'Saved_Addresses',
      desc: '',
      args: [],
    );
  }

  /// `Home, office..`
  String get Home_office {
    return Intl.message(
      'Home, office..',
      name: 'Home_office',
      desc: '',
      args: [],
    );
  }

  /// `Your Save Products`
  String get Your_Save_Products {
    return Intl.message(
      'Your Save Products',
      name: 'Your_Save_Products',
      desc: '',
      args: [],
    );
  }

  /// `Select your Language here..`
  String get Select_your_Language_here {
    return Intl.message(
      'Select your Language here..',
      name: 'Select_your_Language_here',
      desc: '',
      args: [],
    );
  }

  /// `Offers, Order tracking messages..`
  String get Offers_Order_tracking_messages {
    return Intl.message(
      'Offers, Order tracking messages..',
      name: 'Offers_Order_tracking_messages',
      desc: '',
      args: [],
    );
  }

  /// `Profile setting`
  String get Profile_setting {
    return Intl.message(
      'Profile setting',
      name: 'Profile_setting',
      desc: '',
      args: [],
    );
  }

  /// `Full Name, Password..`
  String get Full_Name_Password {
    return Intl.message(
      'Full Name, Password..',
      name: 'Full_Name_Password',
      desc: '',
      args: [],
    );
  }

  /// `App Feedback`
  String get App_Feedback {
    return Intl.message(
      'App Feedback',
      name: 'App_Feedback',
      desc: '',
      args: [],
    );
  }

  /// `Give your feedback`
  String get Give_your_feedback {
    return Intl.message(
      'Give your feedback',
      name: 'Give_your_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get Contact_Us {
    return Intl.message(
      'Contact Us',
      name: 'Contact_Us',
      desc: '',
      args: [],
    );
  }

  /// `Contact for all the queries`
  String get Contact_for_all_the_queries {
    return Intl.message(
      'Contact for all the queries',
      name: 'Contact_for_all_the_queries',
      desc: '',
      args: [],
    );
  }

  /// `Referral Points`
  String get Referral_Points {
    return Intl.message(
      'Referral Points',
      name: 'Referral_Points',
      desc: '',
      args: [],
    );
  }

  /// `Earn Referral Points`
  String get Earn_Referral_Points {
    return Intl.message(
      'Earn Referral Points',
      name: 'Earn_Referral_Points',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get Terms_Conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'Terms_Conditions',
      desc: '',
      args: [],
    );
  }

  /// `T&C for use of Platform`
  String get TC_for_use_of_Platform {
    return Intl.message(
      'T&C for use of Platform',
      name: 'TC_for_use_of_Platform',
      desc: '',
      args: [],
    );
  }

  /// `Help/Customer Care`
  String get HelpCustomer_Care {
    return Intl.message(
      'Help/Customer Care',
      name: 'HelpCustomer_Care',
      desc: '',
      args: [],
    );
  }

  /// `Contact for all queries`
  String get Contact_for_all_queries {
    return Intl.message(
      'Contact for all queries',
      name: 'Contact_for_all_queries',
      desc: '',
      args: [],
    );
  }

  /// `LOG OUT`
  String get LOG_OUT {
    return Intl.message(
      'LOG OUT',
      name: 'LOG_OUT',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get OrderHistory {
    return Intl.message(
      'Order History',
      name: 'OrderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Open Orders`
  String get OpenOrders {
    return Intl.message(
      'Open Orders',
      name: 'OpenOrders',
      desc: '',
      args: [],
    );
  }

  /// `Qty`
  String get Qty {
    return Intl.message(
      'Qty',
      name: 'Qty',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get ViewDetails {
    return Intl.message(
      'View Details',
      name: 'ViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Past Orders`
  String get PastOrders {
    return Intl.message(
      'Past Orders',
      name: 'PastOrders',
      desc: '',
      args: [],
    );
  }

  /// ` Rate & Review Product`
  String get RateReviewProduct {
    return Intl.message(
      ' Rate & Review Product',
      name: 'RateReviewProduct',
      desc: '',
      args: [],
    );
  }

  /// ` Need Help?`
  String get NeedHelp {
    return Intl.message(
      ' Need Help?',
      name: 'NeedHelp',
      desc: '',
      args: [],
    );
  }

  /// ` Delivery Status:`
  String get DeliveryStatus {
    return Intl.message(
      ' Delivery Status:',
      name: 'DeliveryStatus',
      desc: '',
      args: [],
    );
  }

  /// ` Ordered:`
  String get Ordered {
    return Intl.message(
      ' Ordered:',
      name: 'Ordered',
      desc: '',
      args: [],
    );
  }

  /// `Select Address`
  String get SelectAddress {
    return Intl.message(
      'Select Address',
      name: 'SelectAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get Addnewaddress {
    return Intl.message(
      'Add new address',
      name: 'Addnewaddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone No.`
  String get PhoneNo {
    return Intl.message(
      'Phone No.',
      name: 'PhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `REMOVE`
  String get REMOVE {
    return Intl.message(
      'REMOVE',
      name: 'REMOVE',
      desc: '',
      args: [],
    );
  }

  /// `by`
  String get by {
    return Intl.message(
      'by',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get PersonalDetails {
    return Intl.message(
      'Personal Details',
      name: 'PersonalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save Details`
  String get SaveDetails {
    return Intl.message(
      'Save Details',
      name: 'SaveDetails',
      desc: '',
      args: [],
    );
  }

  /// `Write Review`
  String get WriteReview {
    return Intl.message(
      'Write Review',
      name: 'WriteReview',
      desc: '',
      args: [],
    );
  }

  /// `Write Feedback`
  String get WriteFeedback {
    return Intl.message(
      'Write Feedback',
      name: 'WriteFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get TrackOrder {
    return Intl.message(
      'Track Order',
      name: 'TrackOrder',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get ContinueShopping {
    return Intl.message(
      'Continue Shopping',
      name: 'ContinueShopping',
      desc: '',
      args: [],
    );
  }

  /// `Your rating:`
  String get YourRating {
    return Intl.message(
      'Your rating:',
      name: 'YourRating',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get HelpCenter {
    return Intl.message(
      'Help Center',
      name: 'HelpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Store Details`
  String get StoreDetails {
    return Intl.message(
      'Store Details',
      name: 'StoreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Default store address`
  String get Default_store_address {
    return Intl.message(
      'Default store address',
      name: 'Default_store_address',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get Accept {
    return Intl.message(
      'Accept',
      name: 'Accept',
      desc: '',
      args: [],
    );
  }

  /// `Accept & Decline Orders`
  String get Accept_DeclineOrders {
    return Intl.message(
      'Accept & Decline Orders',
      name: 'Accept_DeclineOrders',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get OrderSummary {
    return Intl.message(
      'Order Summary',
      name: 'OrderSummary',
      desc: '',
      args: [],
    );
  }

  /// `CONFIRM`
  String get CONFIRM {
    return Intl.message(
      'CONFIRM',
      name: 'CONFIRM',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get CANCEL {
    return Intl.message(
      'CANCEL',
      name: 'CANCEL',
      desc: '',
      args: [],
    );
  }

  /// `Order Requests`
  String get OrderRequests {
    return Intl.message(
      'Order Requests',
      name: 'OrderRequests',
      desc: '',
      args: [],
    );
  }

  /// `Check Order Requests..`
  String get CheckOrderRequests {
    return Intl.message(
      'Check Order Requests..',
      name: 'CheckOrderRequests',
      desc: '',
      args: [],
    );
  }

  /// `Add Store Name`
  String get Add_Store_Name {
    return Intl.message(
      'Add Store Name',
      name: 'Add_Store_Name',
      desc: '',
      args: [],
    );
  }

  /// `Add Store Address`
  String get Add_Store_Address {
    return Intl.message(
      'Add Store Address',
      name: 'Add_Store_Address',
      desc: '',
      args: [],
    );
  }

  /// `Town/City`
  String get Town_city {
    return Intl.message(
      'Town/City',
      name: 'Town_city',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get Mobile_Number {
    return Intl.message(
      'Mobile Number',
      name: 'Mobile_Number',
      desc: '',
      args: [],
    );
  }

  /// `Pin Code`
  String get Pin_Code {
    return Intl.message(
      'Pin Code',
      name: 'Pin_Code',
      desc: '',
      args: [],
    );
  }

  /// `flat, house No., building..`
  String get flat_house_No_building {
    return Intl.message(
      'flat, house No., building..',
      name: 'flat_house_No_building',
      desc: '',
      args: [],
    );
  }

  /// `area, colony, street`
  String get area_colony_street {
    return Intl.message(
      'area, colony, street',
      name: 'area_colony_street',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get Attachments {
    return Intl.message(
      'Attachments',
      name: 'Attachments',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get Upload {
    return Intl.message(
      'Upload',
      name: 'Upload',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Your account is Under Review`
  String get Your_account_is_Under_Review {
    return Intl.message(
      'Your account is Under Review',
      name: 'Your_account_is_Under_Review',
      desc: '',
      args: [],
    );
  }

  /// `We will update you shortly.`
  String get We_will_update_you_shortly {
    return Intl.message(
      'We will update you shortly.',
      name: 'We_will_update_you_shortly',
      desc: '',
      args: [],
    );
  }

  /// `Select Type`
  String get Select_Type {
    return Intl.message(
      'Select Type',
      name: 'Select_Type',
      desc: '',
      args: [],
    );
  }

  /// `Select Product Category`
  String get Select_Product_Category {
    return Intl.message(
      'Select Product Category',
      name: 'Select_Product_Category',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get Type {
    return Intl.message(
      'Type',
      name: 'Type',
      desc: '',
      args: [],
    );
  }

  /// `Select Subcategory`
  String get Select_Subcategory {
    return Intl.message(
      'Select Subcategory',
      name: 'Select_Subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Subcategory`
  String get Subcategory {
    return Intl.message(
      'Subcategory',
      name: 'Subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Category/Subcategory`
  String get Category_Subcategory {
    return Intl.message(
      'Category/Subcategory',
      name: 'Category_Subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Upload Images`
  String get Upload_Images {
    return Intl.message(
      'Upload Images',
      name: 'Upload_Images',
      desc: '',
      args: [],
    );
  }

  /// `Locations`
  String get Locations {
    return Intl.message(
      'Locations',
      name: 'Locations',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get Offer {
    return Intl.message(
      'Offer',
      name: 'Offer',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Title {
    return Intl.message(
      'Title',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Terms & condition`
  String get Terms_condition {
    return Intl.message(
      'Terms & condition',
      name: 'Terms_condition',
      desc: '',
      args: [],
    );
  }

  /// `Variations:`
  String get Variations {
    return Intl.message(
      'Variations:',
      name: 'Variations',
      desc: '',
      args: [],
    );
  }

  /// `Add-Ons:`
  String get Add_Ons_colon {
    return Intl.message(
      'Add-Ons:',
      name: 'Add_Ons_colon',
      desc: '',
      args: [],
    );
  }

  /// `Shipping & Prices:`
  String get Shipping_Prices {
    return Intl.message(
      'Shipping & Prices:',
      name: 'Shipping_Prices',
      desc: '',
      args: [],
    );
  }

  /// `Create a Variation`
  String get Create_a_Variation {
    return Intl.message(
      'Create a Variation',
      name: 'Create_a_Variation',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get Name_colon {
    return Intl.message(
      'Name:',
      name: 'Name_colon',
      desc: '',
      args: [],
    );
  }

  /// `Variation Name`
  String get Variation_Name {
    return Intl.message(
      'Variation Name',
      name: 'Variation_Name',
      desc: '',
      args: [],
    );
  }

  /// `Sub-Type:`
  String get Sub_Type {
    return Intl.message(
      'Sub-Type:',
      name: 'Sub_Type',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `SUBMIT`
  String get SUBMIT {
    return Intl.message(
      'SUBMIT',
      name: 'SUBMIT',
      desc: '',
      args: [],
    );
  }

  /// `Create a Shipping & Pricing `
  String get Create_a_Shipping_Pricing {
    return Intl.message(
      'Create a Shipping & Pricing ',
      name: 'Create_a_Shipping_Pricing',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Method`
  String get Shipping_Method {
    return Intl.message(
      'Shipping Method',
      name: 'Shipping_Method',
      desc: '',
      args: [],
    );
  }

  /// `Add-ons`
  String get Add_ons {
    return Intl.message(
      'Add-ons',
      name: 'Add_ons',
      desc: '',
      args: [],
    );
  }

  /// `Per Hr`
  String get Per_Hr {
    return Intl.message(
      'Per Hr',
      name: 'Per_Hr',
      desc: '',
      args: [],
    );
  }

  /// `Per Day`
  String get Per_Day {
    return Intl.message(
      'Per Day',
      name: 'Per_Day',
      desc: '',
      args: [],
    );
  }

  /// `Lifetime`
  String get Lifetime {
    return Intl.message(
      'Lifetime',
      name: 'Lifetime',
      desc: '',
      args: [],
    );
  }

  /// `Service Time`
  String get Service_Time {
    return Intl.message(
      'Service Time',
      name: 'Service_Time',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get Start_Time {
    return Intl.message(
      'Start Time',
      name: 'Start_Time',
      desc: '',
      args: [],
    );
  }

  /// `End_Time`
  String get End_Time {
    return Intl.message(
      'End_Time',
      name: 'End_Time',
      desc: '',
      args: [],
    );
  }

  /// `Select Day`
  String get Select_Day {
    return Intl.message(
      'Select Day',
      name: 'Select_Day',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address `
  String get Add_New_Address {
    return Intl.message(
      'Add New Address ',
      name: 'Add_New_Address',
      desc: '',
      args: [],
    );
  }

  /// `Add  a new address `
  String get Add_a_new_address {
    return Intl.message(
      'Add  a new address ',
      name: 'Add_a_new_address',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get Add_Address {
    return Intl.message(
      'Add Address',
      name: 'Add_Address',
      desc: '',
      args: [],
    );
  }

  /// `RESET`
  String get RESET {
    return Intl.message(
      'RESET',
      name: 'RESET',
      desc: '',
      args: [],
    );
  }

  /// `Product Added Successfully!`
  String get Product_Added_Successfully {
    return Intl.message(
      'Product Added Successfully!',
      name: 'Product_Added_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Service Uploaded Successful!`
  String get Service_Uploaded_Successful {
    return Intl.message(
      'Service Uploaded Successful!',
      name: 'Service_Uploaded_Successful',
      desc: '',
      args: [],
    );
  }

  /// `GO TO HOME`
  String get GO_TO_HOME {
    return Intl.message(
      'GO TO HOME',
      name: 'GO_TO_HOME',
      desc: '',
      args: [],
    );
  }

  /// `Create a Add-Ons`
  String get Create_a_Add_Ons {
    return Intl.message(
      'Create a Add-Ons',
      name: 'Create_a_Add_Ons',
      desc: '',
      args: [],
    );
  }

  /// `Select Service Start Time`
  String get Select_Service_Start_Time {
    return Intl.message(
      'Select Service Start Time',
      name: 'Select_Service_Start_Time',
      desc: '',
      args: [],
    );
  }

  /// `Select Service End Time`
  String get Select_Service_End_Time {
    return Intl.message(
      'Select Service End Time',
      name: 'Select_Service_End_Time',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get Minute {
    return Intl.message(
      'Minute',
      name: 'Minute',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get Hour {
    return Intl.message(
      'Hour',
      name: 'Hour',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get Select {
    return Intl.message(
      'Select',
      name: 'Select',
      desc: '',
      args: [],
    );
  }

  /// `All Active Orders`
  String get All_Active_Orders {
    return Intl.message(
      'All Active Orders',
      name: 'All_Active_Orders',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get Order_Details {
    return Intl.message(
      'Order Details',
      name: 'Order_Details',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get Cancel_Order {
    return Intl.message(
      'Cancel Order',
      name: 'Cancel_Order',
      desc: '',
      args: [],
    );
  }

  /// `Order number is`
  String get Order_number_is {
    return Intl.message(
      'Order number is',
      name: 'Order_number_is',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get All_Categories {
    return Intl.message(
      'All Categories',
      name: 'All_Categories',
      desc: '',
      args: [],
    );
  }

  /// `Add New Category`
  String get Add_New_Category {
    return Intl.message(
      'Add New Category',
      name: 'Add_New_Category',
      desc: '',
      args: [],
    );
  }

  /// `New Category Name`
  String get New_Category_Name {
    return Intl.message(
      'New Category Name',
      name: 'New_Category_Name',
      desc: '',
      args: [],
    );
  }

  /// `Subcategory Name`
  String get Subcategory_Name {
    return Intl.message(
      'Subcategory Name',
      name: 'Subcategory_Name',
      desc: '',
      args: [],
    );
  }

  /// `Add Subcategory`
  String get Add_Subcategory {
    return Intl.message(
      'Add Subcategory',
      name: 'Add_Subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Store Name`
  String get Store_Name {
    return Intl.message(
      'Store Name',
      name: 'Store_Name',
      desc: '',
      args: [],
    );
  }

  /// `Show Store`
  String get Show_Store {
    return Intl.message(
      'Show Store',
      name: 'Show_Store',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate Seller`
  String get Deactivate_Seller {
    return Intl.message(
      'Deactivate Seller',
      name: 'Deactivate_Seller',
      desc: '',
      args: [],
    );
  }

  /// `Delete Users`
  String get Delete_User {
    return Intl.message(
      'Delete Users',
      name: 'Delete_User',
      desc: '',
      args: [],
    );
  }

  /// `All Sellers Requests`
  String get All_Sellers_Requests {
    return Intl.message(
      'All Sellers Requests',
      name: 'All_Sellers_Requests',
      desc: '',
      args: [],
    );
  }

  /// `Approve Seller`
  String get Approve_Seller {
    return Intl.message(
      'Approve Seller',
      name: 'Approve_Seller',
      desc: '',
      args: [],
    );
  }

  /// `All Users`
  String get All_Users {
    return Intl.message(
      'All Users',
      name: 'All_Users',
      desc: '',
      args: [],
    );
  }

  /// `Check and Delete Users`
  String get All_Users_Sub {
    return Intl.message(
      'Check and Delete Users',
      name: 'All_Users_Sub',
      desc: '',
      args: [],
    );
  }

  /// `All Sellers`
  String get All_Sellers {
    return Intl.message(
      'All Sellers',
      name: 'All_Sellers',
      desc: '',
      args: [],
    );
  }

  /// `Check and Delete Sellers`
  String get All_Sellers_Sub {
    return Intl.message(
      'Check and Delete Sellers',
      name: 'All_Sellers_Sub',
      desc: '',
      args: [],
    );
  }

  /// `Products & Services`
  String get Products_Services {
    return Intl.message(
      'Products & Services',
      name: 'Products_Services',
      desc: '',
      args: [],
    );
  }

  /// `Check and Modify Products\nand Services`
  String get Products_Services_Sub {
    return Intl.message(
      'Check and Modify Products\nand Services',
      name: 'Products_Services_Sub',
      desc: '',
      args: [],
    );
  }

  /// `Add or Delete Category & Subcategory`
  String get Categories_Sub {
    return Intl.message(
      'Add or Delete Category & Subcategory',
      name: 'Categories_Sub',
      desc: '',
      args: [],
    );
  }

  /// `Active Orders`
  String get Active_Orders {
    return Intl.message(
      'Active Orders',
      name: 'Active_Orders',
      desc: '',
      args: [],
    );
  }

  /// `Check Details & Remove Orders`
  String get Active_Orders_Sub {
    return Intl.message(
      'Check Details & Remove Orders',
      name: 'Active_Orders_Sub',
      desc: '',
      args: [],
    );
  }

  /// `App Feedbacks`
  String get App_Feedbacks {
    return Intl.message(
      'App Feedbacks',
      name: 'App_Feedbacks',
      desc: '',
      args: [],
    );
  }

  /// `Check all the feedbacks`
  String get App_Feedbacks_Sub {
    return Intl.message(
      'Check all the feedbacks',
      name: 'App_Feedbacks_Sub',
      desc: '',
      args: [],
    );
  }

  /// `Seller Requests`
  String get Seller_Requests {
    return Intl.message(
      'Seller Requests',
      name: 'Seller_Requests',
      desc: '',
      args: [],
    );
  }

  /// `Verify the sellers`
  String get Seller_Requests_Sub {
    return Intl.message(
      'Verify the sellers',
      name: 'Seller_Requests_Sub',
      desc: '',
      args: [],
    );
  }

  /// `Sub Categories`
  String get Sub_Categories {
    return Intl.message(
      'Sub Categories',
      name: 'Sub_Categories',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
