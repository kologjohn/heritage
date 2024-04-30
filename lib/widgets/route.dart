import 'package:jona/components/mobile_shop.dart';
import 'package:jona/components/shop.dart';
import 'package:jona/components/tablet_shop.dart';
import 'package:jona/responsive/desktop_scaffold.dart';
import 'package:jona/responsive/mobile_scaffold.dart';
import 'package:jona/responsive/responsive_layout.dart';
import 'package:jona/responsive/tablet_scaffold.dart';
import 'package:jona/widgets/cart.dart';

class Routes{
  static String cart="cart";
  static String dashboard="dashboard";
  static String mainShop="mainShop";
}

final pages={
  Routes.cart:(context)=>const CartView(),
  Routes.mainShop:(context)=>const ResponsiveLayout(isMobile: MobileShop(), isTablet: TabletShop(), isDesktop: ShopPage()),
  Routes.dashboard:(context)=>const ResponsiveLayout(isMobile: MobileScaffold(), isTablet: TabletScaffold(), isDesktop: DesktopScaffold(),
  ),
};