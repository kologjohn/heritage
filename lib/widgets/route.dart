import 'package:flutter/material.dart';
import 'package:jona/components/shop.dart';
import 'package:jona/responsive/desktop_scaffold.dart';
import 'package:jona/responsive/mobile_scaffold.dart';
import 'package:jona/responsive/responsive_layout.dart';
import 'package:jona/responsive/tablet_scaffold.dart';
import 'package:jona/widgets/cart.dart';

class Routes{
  static String shop="shop";
  static String cart="cart";
  static String dashboard="dashboard";
}

final pages={
  Routes.shop:(context)=>const ShopPage(),
  Routes.cart:(context)=>const CartView(),
  Routes.dashboard:(context)=>const ResponsiveLayout(isMobile: MobileScaffold(), isTablet: TabletScaffold(), isDesktop: DesktopScaffold()

  ),
};