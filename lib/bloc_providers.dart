import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/features/auth/auth.dart';
import 'package:autogas/features/auth/presentation/forgot_password/bloc/forgot_bloc.dart';
import 'package:autogas/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:autogas/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:autogas/features/client/presentation/page/home/bloc/client_home_bloc.dart';
import 'package:autogas/features/profile/info/bloc/profile_info_bloc.dart';
import 'package:autogas/features/profile/update/bloc/profile_update_bloc.dart';
import 'package:autogas/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUsescases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUsescases>())..add(RegisterInitEvent())),
  BlocProvider<ForgotBloc>(create: (context) => ForgotBloc(locator<AuthUsescases>()), child: const ForgotPassword(),),
  BlocProvider<ClientHomeBloc>(create: (context) => ClientHomeBloc(locator<AuthUsescases>())),
  BlocProvider<ProfileInfoBloc>(create: (context) => ProfileInfoBloc(locator<AuthUsescases>())..add(GetUserInfo())),
  BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc()),
  // BlocProvider<ClientMapSeekerBloc>(create: (context) => ClientMapSeekerBloc(context.read<BlocSocketIO>(), locator<GeolocatorUseCases>(), locator<SocketUseCases>())),
  // BlocProvider<ClientMapBookingInfoBloc>(create: (context) => ClientMapBookingInfoBloc(context.read<BlocSocketIO>(), locator<GeolocatorUseCases>(), locator<ClientRequestsUseCases>(), locator<AuthUsescases>())),
  // BlocProvider<DriverClientRequestsBloc>(create: (context) => DriverClientRequestsBloc(context.read<BlocSocketIO>(), locator<ClientRequestsUseCases>(), locator<DriversPositionUseCases>(), locator<AuthUsescases>(), locator<DriverTripRequestUseCases>())),
  // BlocProvider<ClientDriverOffersBloc>(create: (context) => ClientDriverOffersBloc(context.read<BlocSocketIO>(), locator<DriverTripRequestUseCases>(), locator<ClientRequestsUseCases>())),
  // BlocProvider<DriverMapLocationBloc>(create: (context) => DriverMapLocationBloc(context.read<BlocSocketIO>(), locator<GeolocatorUseCases>(),locator<SocketUseCases>(), locator<AuthUsescases>(), locator<DriversPositionUseCases>())),
  // BlocProvider<DriverCarInfoBloc>(create: (context) => DriverCarInfoBloc(locator<AuthUsescases>(), locator<DriverCarInfoUseCases>())),
  // BlocProvider<ClientMapTripBloc>(create: (context) => ClientMapTripBloc(context.read<BlocSocketIO>(), locator<ClientRequestsUseCases>(), locator<GeolocatorUseCases>(), locator<AuthUsescases>())),
  // BlocProvider<DriverMapTripBloc>(create: (context) => DriverMapTripBloc(context.read<BlocSocketIO>(), locator<ClientRequestsUseCases>(), locator<GeolocatorUseCases>())),
  // BlocProvider<DriverRatingTripBloc>(create: (context) => DriverRatingTripBloc(locator<ClientRequestsUseCases>())),
  // BlocProvider<ClientRatingTripBloc>(create: (context) => ClientRatingTripBloc(locator<ClientRequestsUseCases>())),
  // BlocProvider<DriverHistoryTripBloc>(create: (context) => DriverHistoryTripBloc(locator<ClientRequestsUseCases>(), locator<AuthUsescases>())),
  // BlocProvider<ClientHistoryTripBloc>(create: (context) => ClientHistoryTripBloc(locator<ClientRequestsUseCases>(), locator<AuthUsescases>())),
];
