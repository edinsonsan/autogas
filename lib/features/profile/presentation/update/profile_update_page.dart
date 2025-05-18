import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/profile/presentation/info/bloc/profile_info_bloc.dart';
import 'package:autogas/features/profile/presentation/update/bloc/profile_update_bloc.dart';
import 'package:autogas/features/profile/presentation/update/profile_update_content.dart';
import 'package:autogas/features/shared/shared.dart';
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
      context.read<ProfileUpdateBloc>().add(
        ProfileUpdateInitEvent(user: widget.user),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // SEGUNDO - CTRL + S
    void snackBar(BuildContext context, String errorMessage) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    }

    final user = widget.user;
    return Scaffold(
      body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            snackBar(context, response.message);
          } else if (response is Success) {
            User user = response.data as User;
            snackBar(context, '¡Actualización Exitosa!');
            context.read<ProfileUpdateBloc>().add(
              UpdateUserSession(user: user),
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                context.read<ProfileInfoBloc>().add(GetUserInfo());
              }
            });
          }
        },
        child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
          builder: (context, state) {
            if (state.formStatus == FormStatus.validating) {
              return Stack(
                children: [
                  ProfileUpdateContent(user: user, profileUpdateState: state),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return ProfileUpdateContent(user: user, profileUpdateState: state);
          },
        ),
      ),
    );
  }
}
