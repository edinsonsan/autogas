
import 'package:autogas/features/client/presentation/page/home/client_home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:autogas/features/auth/auth.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [

    //*AUTH
    GoRoute(
      path: '/login',
      name: LoginPage.name,
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/register',
      name: RegisterPage.name,
      builder: (context, state) => const RegisterPage(),
    ),

    GoRoute(
      path: '/forgot-password',
      name: ForgotPassword.name,
      builder: (context, state) => const ForgotPassword(),
    ),

    GoRoute(
      path: '/client/home',
      name: ClientHomePage.name,
      builder: (context, state) =>  const ClientHomePage(),
    ),

    // GoRoute(
    //   path: '/progress',
    //   name: ProgressScreen.name,
    //   builder: (context, state) =>  const ProgressScreen(),
    // ),

    // GoRoute(
    //   path: '/snackbar',
    //   name: SnackbarScreen.name,
    //   builder: (context, state) =>  const SnackbarScreen(),
    // ),

    // GoRoute(
    //   path: '/animated',
    //   name: AnimatedScreen.name,
    //   builder: (context, state) =>  const AnimatedScreen(),
    // ),

    // GoRoute(
    //   path: '/ui-controls',
    //   name: UiControllsScreen.name,
    //   builder: (context, state) =>  const UiControllsScreen(),
    // ),

    // GoRoute(
    //   path: '/tutorial',
    //   name: AppTutorialScreen.name,
    //   builder: (context, state) =>  const AppTutorialScreen(),
    // ),

    // GoRoute(
    //   path: '/infinite',
    //   name: InfiniteScrollScreen.name,
    //   builder: (context, state) =>  const InfiniteScrollScreen(),
    // ),

    // GoRoute(
    //   path: '/theme-changer',
    //   name: ThemeChangerScreen.name,
    //   builder: (context, state) =>  const ThemeChangerScreen(),
    // ),

  ],
);