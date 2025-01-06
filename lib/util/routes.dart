import 'package:unipos_flutter/screens/entries/childrens/customer_selection_screen/customer_selection_screen.dart';
import 'package:unipos_flutter/screens/home_screen/home_screen.dart';
import 'package:unipos_flutter/screens/entries/childrens/sales_screen/sales_screen.dart';
import 'package:unipos_flutter/screens/splash_screen/splash_screen.dart';

final routes = {
  splash: (context) => SplashScreen(),
  home: (context) => HomeScreen(),
  sales: (context) => SalesScreen(),
  customerSelection: (context) => CustomerSelectionScreen(),
};

const splash = "/";
const home = "/home";
const sales = "/sales";
const customerSelection = "/customerSelection";
const productSelection = "/productSelection";
