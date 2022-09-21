import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/screens/kyc_screens/kyc_screen1.dart';
import 'package:shiprocket/provider/added_customer.dart';
import 'package:shiprocket/provider/courier_company_provider.dart';
import 'package:shiprocket/screens/add_customer_screen.dart';
import 'package:shiprocket/screens/bank_account_details_screen.dart';
import 'package:shiprocket/screens/billing_address_screen.dart';
import 'package:shiprocket/screens/courier_companies/courier_companies.dart';
import 'package:shiprocket/screens/courier_priorities.dart';
import 'package:shiprocket/screens/customers_screen.dart';
import 'package:shiprocket/screens/dashboard_screen/dashboard_screen.dart';
import 'package:shiprocket/screens/introduction_screen.dart';
import 'package:shiprocket/screens/more_screen.dart';
import 'package:shiprocket/screens/notifications_screen.dart';
import 'package:shiprocket/screens/settings_screen.dart';
import 'package:shiprocket/screens/shiprocket_trainings.dart';
import 'package:shiprocket/screens/view_profile_screen.dart';
import 'package:shiprocket/screens/wallet_and_passbook_screen.dart/wallet_passbook_tab.dart';
import 'package:shiprocket/screens/welcome_screen.dart';
import './screens/signup_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/bottom_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddedCustomerProvider>(
          create: (context) => AddedCustomerProvider(),
        ),
        ChangeNotifierProvider<CourierCompanyProvider>(
          create: (context) => CourierCompanyProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Shiprocket',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavigation(),
      ),
    );
  }
}
