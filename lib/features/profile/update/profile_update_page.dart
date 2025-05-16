import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/profile/update/bloc/profile_update_bloc.dart';
import 'package:autogas/features/profile/update/profile_update_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdatePage extends StatefulWidget {
  final User? user;

  const ProfileUpdatePage({super.key, this.user});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  @override
  void initState() {
    // PRIMER EVENTO EN DISPARARSE - UNA SOLA VEZ
    // TODO: implement initState
    super.initState();
    print('METODO INIT STATE');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print('METODO INIT STATE BINDING');
      context.read<ProfileUpdateBloc>().add(ProfileUpdateInitEvent(user: widget.user));
    });
  }
  @override
  Widget build(BuildContext context) { // SEGUNDO - CTRL + S
    final user = widget.user;
    return Scaffold(
      body: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
        builder: (context, state) {
          return ProfileUpdateContent(user: user, profileUpdateState: state,);
        },
      ),
    );
  }
}
