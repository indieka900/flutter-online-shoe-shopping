import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:flutter_project/controllers/favorites_provider.dart';
import 'package:flutter_project/controllers/mainscreen_provider.dart';
import 'package:flutter_project/controllers/product_provider.dart';
import 'package:flutter_project/views/ui/mainscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainScreenNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              //useMaterial3: true,
              ),
          home: MainScreen(),
        );
      },
    );
  }
}
