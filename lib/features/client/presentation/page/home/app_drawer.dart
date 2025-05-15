import 'package:autogas/config/menu/menu_items.dart';
import 'package:autogas/features/client/presentation/page/home/bloc/client_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final hasNotch = MediaQuery.of(context).padding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    return BlocBuilder<ClientHomeBloc, ClientHomeState>(
      builder: (context, state) {
        return NavigationDrawer(
          elevation: 4,
          selectedIndex: state.pageIndex,
          onDestinationSelected: (int index) {
            context.read<ClientHomeBloc>().add(
              ChangeDrawerPage(pageIndex: index),
            );
            Navigator.of(context).pop(); // Cierra el drawer
          },
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 12, 38, 145),
                    Color.fromARGB(255, 34, 156, 249),
                  ],
                ),
              ),
              child: Text(
                'Menu del cliente',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 5, 16, 10),
              child: Text('Edinson Sandoval', style: textStyles.titleSmall),
            ),

            // Menu principal (primeros 3 elementos)
            ...appMenuItems
                .asMap()
                .entries
                .where((entry) => entry.key < 3)
                .map(
                  (entry) => NavigationDrawerDestination(
                    icon: Icon(entry.value.icon),
                    label: Text(entry.value.titulo),
                  ),
                ),

            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('Más Opciones'),
            ),

            // Resto de las opciones
            ...appMenuItems
                .asMap()
                .entries
                .where((entry) => entry.key >= 3)
                .map(
                  (entry) => NavigationDrawerDestination(
                    icon: Icon(entry.value.icon),
                    label: Text(entry.value.titulo),
                  ),
                ),

            const Divider(),

            // Cerrar sesión
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  context.read<ClientHomeBloc>().add(Logout());
                  context.go('/login');
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
