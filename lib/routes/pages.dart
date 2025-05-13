import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretium_clone/application/authentication/intro/onboarding_screen.dart';
import 'package:pretium_clone/application/authentication/intro/splash_screen.dart';
import 'package:pretium_clone/application/authentication/signIn/bloc/sign_in_bloc.dart';
import 'package:pretium_clone/application/authentication/signIn/sign_in.dart';
import 'package:pretium_clone/application/authentication/signUp/email_verification/otp_screen.dart';
import 'package:pretium_clone/application/authentication/signUp/get_started.dart';
import 'package:pretium_clone/routes/names.dart';

import '../application/authentication/signUp/signup_screen.dart';
import '../application/user/home/bloc/home_bloc.dart';
import '../application/user/home/home_screen.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const SplashScreen(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.onboarding,
        page: const OnboardingScreen(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.getStarted,
        page: GetStarted(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignInScreen(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.signUp,
        page: const SignupScreen(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.otpEmailVerification,
        page: OtpEmailVerification(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.homeScreen,
        page: HomeScreen(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name macthing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstOpen =
            3 > 4; // Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedin = 3 > 4; //Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
              builder: (_) => const Scaffold(),
              settings: settings,
            );
          }

          return MaterialPageRoute(
            builder: (_) => SignInScreen(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
      builder: (_) => SignInScreen(),
      settings: settings,
    );
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
