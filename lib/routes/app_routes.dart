import 'package:flutter/material.dart';
import 'package:moni5/presentation/awal_screen/awal_screen.dart';
// import 'package:moni5/presentation/kumpulanAnggaran/kumpulan_anggaran.dart';

import 'package:moni5/presentation/navbar_screen/navbar_screen.dart';
import 'package:moni5/presentation/login_screen/login_screen.dart';
import 'package:moni5/presentation/register_screen/register_screen.dart';
import 'package:moni5/presentation/tujuan_screen/tujuan_screen.dart';
import 'package:moni5/presentation/transaksi_screen/transaksi_screen.dart';
import 'package:moni5/presentation/anggaran_screen/anggaran_screen.dart';
import 'package:moni5/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:moni5/presentation/admin_page/admin_page.dart';

class AppRoutes {
  static const String awalScreen = '/awal_screen';

  static const String mainPage = '/main_page';

  static const String navbarScreen = '/navbar_screen';

  static const String loginScreen = '/login_screen';
  static const String kumpulanAnggaran = '/kumpulan_anggaran';


  static const String registerScreen = '/register_screen';

  static const String tujuanScreen = '/tujuan_screen';

  static const String transaksiScreen = '/transaksi_screen';

  static const String anggaranScreen = '/anggaran_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
   static const String adminpage = '/admin_page';


  static Map<String, WidgetBuilder> routes = {
    awalScreen: (context) => AwalScreen(),
    navbarScreen: (context) => NavbarScreen(),
    loginScreen: (context) => LoginScreen(),
    // kumpulanAnggaran: (context) => KumpulanAnggaran(),
    registerScreen: (context) => RegisterScreen(),
    tujuanScreen: (context) => TujuanScreen(),
    transaksiScreen: (context) => TransaksiScreen(),
    anggaranScreen: (context) => AnggaranScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    adminpage: (context) => AdminPage()
    
  };
}