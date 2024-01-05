import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/presentation/anggaran_screen/anggaran_screen.dart';
import 'package:moni5/presentation/main_page/main_page.dart';
import 'package:moni5/widgets/custom_bottom_bar.dart';
import 'package:moni5/presentation/transaksi_screen/transaksi_screen.dart';


// ignore_for_file: must_be_immutable
class NavbarScreen extends StatelessWidget {
  NavbarScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.mainPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Beranda:
        return AppRoutes.mainPage;
      case BottomBarEnum.Transaksi:
        return AppRoutes.transaksiScreen;
      case BottomBarEnum.Anggaran:
        return AppRoutes.anggaranScreen;
      case BottomBarEnum.Akun:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.mainPage:
        return MainPage();
      case AppRoutes.transaksiScreen:
        return TransaksiScreen();
      case AppRoutes.anggaranScreen:
        return AnggaranScreen();
      default:
        return DefaultWidget();
    }
  }
}
