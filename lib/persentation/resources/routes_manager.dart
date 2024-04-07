import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saaid/persentation/order/order_list_view.dart';
import 'package:saaid/persentation/order/order_new_view.dart';
import 'package:saaid/persentation/payment/payment_done.dart';
import 'package:saaid/persentation/payment/payment_view.dart';
import 'package:saaid/persentation/resources/strings_manager.dart';

import '../Main/main_view.dart';
import '../appbar_bottom/bottomNavNew.dart';

import '../forget_password/forget_password_view.dart';
import '../login/login_View.dart';

import '../register/register_view.dart';
import '../service_provider/proiverList_view.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";

  static const String onBoarding = "/onBoarding";
  static const String store = "/store";
  static const String designers = "/designer";

  static const String newhome = "/newhome";

  static const String profile = "/profile";

  static const String forgetpassword = "/forgetpassword";

  static const String orderlist = "/orderlist";

  static const String ordernew = "/ordernew";

  static const String payment = "/payment";
  static const String paymentdone = "/paymentdone";

  static const String providers = "/providers";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());



      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());




      case Routes.newhome:
        return MaterialPageRoute(builder: (_) => const BottomNavBarDemo());




      case Routes.forgetpassword:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordView());

      case Routes.orderlist:
        return MaterialPageRoute(builder: (_) =>  OrderViewList());

      case Routes.ordernew:
        return MaterialPageRoute(builder: (_) =>  OrderNewView());

      case Routes.payment:
        return MaterialPageRoute(builder: (_) =>  PaymentView(price: "30"));
      case Routes.paymentdone:
        return MaterialPageRoute(builder: (_) =>  PaymentDone());

      case Routes.providers:
        return MaterialPageRoute(builder: (_) =>  ProviderListView());

      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
                title: const Text(
                    AppStrings.noRoutValue) // todo move to strings manager
                ),
            body: const Center(
              child: Text(AppStrings.noRoutValue),
            ) // todo move to strings manager
            ));
  }
}
