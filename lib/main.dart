import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/seller/seller_home.dart';
import 'package:whatsup1to1/app/user/user_home.dart';
import 'package:whatsup1to1/app/user_on_boarding/views/user_on_boarding_screen1.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';
import 'package:whatsup1to1/firebase_options.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/loading.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';
import 'package:whatsup1to1/utils/thems/theme.dart';

import 'app/user_auth/controllers/auth_controller.dart';
import 'app/user_auth/views/user_login_screen.dart';
import 'common/common_providers/localization/localization_provider.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
        const Size(AppConstants.screenWidget, AppConstants.screenHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final locallizationController =
              ref.watch(locallizationCtrProvider);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: locallizationController.locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                title: 'Mid-Ghamr',
                theme: lightThemeData(context),
                // initialRoute: AppRoutes.sellerSelectCategoryScreen,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                home: ref.watch(userStateStreamProvider).when(
                    data: (user) {
                      if (user != null) {
                        return ref
                            .watch(currentAuthUserInfoProvider(user!.uid))
                            .when(
                            data: (userModel) {
                              if(userModel.activated!){
                                if (userModel.accountType ==
                                    "Seller") {
                                  if (userModel.approved!) {
                                    return const SellerHome();
                                  } else {
                                    return const UserLoginScreen();
                                  }
                                }else{
                                  return const UserHome();
                                }
                              }else{
                                showToast(msg: "Your account is deactivated by Admin!");
                                return const UserLoginScreen();
                              }

                            },
                            error: (error, st) => ErrorWidget(error),
                            loading: () => const Scaffold(backgroundColor: MyColors.white,));
                      } else {
                        return UserOnBoardingScreen1();
                      }
                    },
                    error: (error, st) => ErrorWidget(error),
                    loading: () => const LoadingWidget()),
              );
            },
          );
        });;
  }
}
