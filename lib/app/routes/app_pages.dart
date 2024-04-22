import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/views/account.dart';
import 'package:perm_transport_card/app/modules/home/views/ticket.dart';
import 'package:perm_transport_card/app/modules/home/views/trail.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        children: [
          GetPage(name: "/tickets", page: () => const TicketView()),
          GetPage(name: "/trail", page: () => const TrailView()),
          GetPage(name: "/account", page: () => const AccountView()),
        ]),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
