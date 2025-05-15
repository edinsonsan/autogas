import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/client/presentation/page/home/bloc/client_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoContent extends StatelessWidget {
  final User? user;

  const ProfileInfoContent(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(context),
            const Spacer(),
            _actionProfile('EDITAR PERFIL', Icons.edit, () {
              Navigator.pushNamed(context, 'profile/update', arguments: user);
            }),
            _actionProfile('CERRAR SESIÓN', Icons.settings_power, () {
              context.read<ClientHomeBloc>().add(Logout());
              // context.read<DriverHomeBloc>().add(Logout());
              // context.read<BlocSocketIO>().add(DisconnectSocketIO());
              // Navega a la pantalla de login y elimina todas las rutas anteriores
              Navigator.pushNamedAndRemoveUntil(
                context,
                'login',
                (route) => false,
              );
            }),
            const SizedBox(height: 35),
          ],
        ),
        _cardUserInfo(context),
      ],
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Card(
        // color: Colors.white,
        // surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: 115,
              margin: const EdgeInsets.only(top: 25, bottom: 15),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child:
                      user != null
                          ? user!.image != null
                              ? FadeInImage.assetNetwork(
                                placeholder: 'assets/images/user_image.png',
                                image: user!.image!,
                                fit: BoxFit.cover,
                                fadeInDuration: const Duration(seconds: 1),
                              )
                              : Image.asset('assets/images/user_image.png')
                          : Image.asset('assets/images/user_image.png'),
                ),
              ),
            ),
            Text(
              '${user?.name} ${user?.lastname}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(user?.email ?? '..........', style: TextStyle(color: Colors.grey[700])),
            Text(user?.phone ?? '..........', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  Widget _actionProfile(String option, IconData icon, Function() function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListTile(
          title: Text(
            option,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 19, 58, 213),
                  Color.fromARGB(255, 65, 173, 255),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    // final textStyles = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 19, 58, 213),
            Color.fromARGB(255, 65, 173, 255),
          ],
        ),
      ),
      child: const Text(
        'PERFIL DE USUARIO',
        style:
        // textStyles.bodyLarge,
        TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
    );
  }
}
