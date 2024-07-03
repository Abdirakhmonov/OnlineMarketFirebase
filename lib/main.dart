import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/order_controller.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/utils/routes.dart';
import 'package:online_shop_animation/views/screens/home_page.dart';
import 'package:online_shop_animation/views/screens/login_screen.dart';
import 'package:online_shop_animation/views/screens/registr_screens.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return ProductController();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              }

              return const LoginScreen();
            },
          ),
          routes: {
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.register: (context) => const RegisterScreen(),
            AppRoutes.home: (context) => const HomePage(),
          },
        );
      },
    );
  }
}
