import 'package:jona/components/mobile_shop.dart';
import 'package:jona/components/shop.dart';
import 'package:jona/components/single_product.dart';
import 'package:jona/components/tablet_shop.dart';
import 'package:jona/forms/register_page.dart';
import 'package:jona/forms/signin_page.dart';
import 'package:jona/responsive/desktop_scaffold.dart';
import 'package:jona/responsive/mobile_scaffold.dart';
import 'package:jona/responsive/responsive_layout.dart';
import 'package:jona/responsive/tablet_scaffold.dart';
import 'package:jona/widgets/cart.dart';

class Routes{
  static String cart="cart";
  static String dashboard="dashboard";
  static String mainShop="mainShop";
  static String singleProduct="singleProduct";
  static String login="login";
  static String signup="signup";
}

final pages={
  Routes.cart:(context)=>const CartView(),
  Routes.singleProduct:(context)=>const SingleProduct(),
  Routes.login:(context)=>const SignInPage(),
  Routes.signup:(context)=>const RegisterPage(),
  Routes.mainShop:(context)=>const ResponsiveLayout(isMobile: MobileShop(), isTablet: TabletShop(), isDesktop: ShopPage(),),
  Routes.dashboard:(context)=>const ResponsiveLayout(isMobile: MobileScaffold(), isTablet: TabletScaffold(), isDesktop: DesktopScaffold(),
  ),
};