import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Presentation Layer
import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/onboarding/onboarding_screen.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/auth/register_screen.dart';
import 'presentation/screens/user/user_dashboard.dart';
import 'presentation/screens/admin/admin_dashboard.dart';
import 'presentation/screens/features/detail_page.dart';
import 'presentation/screens/features/sort_page.dart';
import 'presentation/screens/features/confirm_order_page.dart';
import 'presentation/screens/features/payment_method_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  
  MyApp({super.key, required this.prefs});

  late final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/user-dashboard',
        builder: (context, state) => const UserDashboard(),
      ),
      GoRoute(
        path: '/admin-dashboard',
        builder: (context, state) => const AdminDashboard(),
      ),
      GoRoute(
        path: '/sort',
        builder: (context, state) => const SortPage(),
      ),
      GoRoute(
        path: '/payment-method',
        builder: (context, state) => const PaymentMethodPage(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) => const DetailPage(),
      ),
      GoRoute(
        path: '/confirm-order',
        builder: (context, state) => const ConfirmOrderPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(prefs),
      child: MaterialApp.router(
        title: 'Kantin App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
