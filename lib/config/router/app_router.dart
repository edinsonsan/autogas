
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/client/presentation/page/home/client_home_page.dart';
import 'package:autogas/features/profile/update/profile_update_page.dart';
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
    
    //* HOME
    GoRoute(
      path: '/client/home',
      name: ClientHomePage.name,
      builder: (context, state) => const ClientHomePage(),
    ),
    // GoRoute(
    //   path: '/driver/home',
    //   name: DriverHomePage.name,
    //   builder: (context, state) => const DriverHomePage(),
    // ),

    // //* ROLES
    // GoRoute(
    //   path: '/roles',
    //   name: RolesPage.name,
    //   builder: (context, state) => const RolesPage(),
    // ),

    // //* CLIENT MAP BOOKING INFO
    // GoRoute(
    //   path: '/client/map/booking',
    //   name: ClientMapBookingInfoPage.name,
    //   builder: (context, state) => const ClientMapBookingInfoPage(),
    // ),

    //* PROFILE UPDATE
    GoRoute(
      path: '/profile/update',
      // name: ProfileUpdatePage.name,
      builder: (context, state) {
        final user = state.extra as User;  // Recibir el objeto User desde state.extra
        return ProfileUpdatePage(user: user);
      },
    ),

    // //* CLIENT DRIVER OFFERS
    // GoRoute(
    //   path: '/client/driver/offers',
    //   name: ClientDriverOffersPage.name,
    //   builder: (context, state) => const ClientDriverOffersPage(),
    // ),

    // //* CLIENT MAP TRIP
    // GoRoute(
    //   path: '/client/map/trip',
    //   name: ClientMapTripPage.name,
    //   builder: (context, state) => const ClientMapTripPage(),
    // ),

    // //* DRIVER MAP TRIP
    // GoRoute(
    //   path: '/driver/map/trip',
    //   name: DriverMapTripPage.name,
    //   builder: (context, state) => const DriverMapTripPage(),
    // ),

    // //* DRIVER RATING TRIP
    // GoRoute(
    //   path: '/driver/rating/trip',
    //   name: DriverRatingTripPage.name,
    //   builder: (context, state) => const DriverRatingTripPage(),
    // ),

    // //* DRIVER CLIENT REQUEST
    // GoRoute(
    //   path: '/driver/client/request',
    //   name: DriverClientRequestsPage.name,
    //   builder: (context, state) => const DriverClientRequestsPage(),
    // ),

    // //* CLIENT RATING TRIP
    // GoRoute(
    //   path: '/client/rating/trip',
    //   name: ClientRatingTripPage.name,
    //   builder: (context, state) => const ClientRatingTripPage(),
    // ),
  ],
);