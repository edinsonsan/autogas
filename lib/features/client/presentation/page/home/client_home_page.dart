import 'package:autogas/features/client/presentation/page/home/app_drawer.dart';
import 'package:autogas/features/client/presentation/page/home/bloc/client_home_bloc.dart';
import 'package:autogas/features/profile/info/profile_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomePage extends StatefulWidget {
  static const String name = 'client_home_page';
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[
    // ClientMapSeekerPage(),
    // ClientHistoryTripPage(),
    const ProfileInfoPage(),
    // RolesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('AuTogas', style: TextStyle(color: colors.primary, fontSize: 20,), ),
      ),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          // El contenido principal puede ser controlado por routes o widgets.
          return pageList[state.pageIndex]; // Reemplazar según sea necesario.
        },
      ),
      drawer: const AppDrawer(
        // onItemSelected: (index) {
        //   final link = appMenuItems[index].link;
        //   context.pushReplacement(link);
        // },
      ),
    );
  }
}