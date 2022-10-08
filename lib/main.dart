import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/provider/added_customer.dart';
import 'package:shiprocket/provider/courier_company_provider.dart';
import 'screens/intro_screen.dart';

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
        home: const IntroScreen(),
      ),
    );
  }
}
