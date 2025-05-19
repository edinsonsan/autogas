import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/profile/presentation/update/bloc/profile_update_bloc.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:autogas/features/shared/utils/gallery_or_photo_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateContent extends StatelessWidget {
  final User? user;
  final ProfileUpdateState profileUpdateState;
  const ProfileUpdateContent({
    super.key,
    this.user,
    required this.profileUpdateState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        // key: profileUpdateState.formKey,
        child: Stack(
          children: [
            Column(
              children: [
                _headerProfile(context),
                const Spacer(),
                _actionProfile(context, 'ACTUALIZAR USUARIO', Icons.check),
                const SizedBox(height: 35),
              ],
            ),
            _cardUserInfo(context),
            const DefaultIconBack(margin: EdgeInsets.only(top: 60, left: 30)),
          ],
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGalleryOrPhotoDialog(
          context,
          () => context.read<ProfileUpdateBloc>().add(PickImage()),
          () => context.read<ProfileUpdateBloc>().add(TakePhoto()),
        );
      },
      child: Container(
        width: 115,
        margin: const EdgeInsets.only(top: 50, bottom: 15),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child:
                profileUpdateState.image != null
                    ? Image.file(profileUpdateState.image!, fit: BoxFit.cover)
                    : user != null
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
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 150),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        // color: Colors.white,
        // surfaceTintColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imageUser(context),
              const SizedBox(height: 20),
              _buildTextField(
                context: context,
                label: 'Nombre',
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                isDark: isDark,
                colors: colors,
                // margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
                // backgroundColor: Colors.grey[200]!,
                initialValue: user?.name,
                onChanged: (text) {
                  context.read<ProfileUpdateBloc>().add(
                    NameChanged(name: Username.dirty(value: text)),
                  );
                },
                errorMessage: profileUpdateState.name.errorMessage,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                context: context,
                label: 'Apellido',
                prefixIcon: Icons.person_add,
                keyboardType: TextInputType.text,
                isDark: isDark,
                colors: colors,
                // margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
                // backgroundColor: Colors.grey[200]!,
                initialValue: user?.lastname,
                onChanged: (text) {
                  context.read<ProfileUpdateBloc>().add(
                    LastNameChanged(lastname: Username.dirty(value: text)),
                  );
                },
                errorMessage: profileUpdateState.lastname.errorMessage,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                context: context,
                label: 'Telefono',
                prefixIcon: Icons.phone_android_rounded,
                keyboardType: TextInputType.phone,
                isDark: isDark,
                colors: colors,
                // margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
                // backgroundColor: Colors.grey[200]!,
                initialValue: user?.phone,
                onChanged: (text) {
                  context.read<ProfileUpdateBloc>().add(
                    PhoneChanged(phone: Phone.dirty(value: text)),
                  );
                },
                errorMessage: profileUpdateState.phone.errorMessage,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20), // Espacio adicional
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionProfile(BuildContext context, String option, IconData icon) {
    return GestureDetector(
      // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onTap: () {
        final state = context.read<ProfileUpdateBloc>().state;
        if (state.isValid) {
          context.read<ProfileUpdateBloc>().add(FormSubmit());
        } else {
          // Fuerzas validación de todos los campos (como "tocar" todos los campos)
          context.read<ProfileUpdateBloc>().add(ForceValidate());
        }
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
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 70),
      height: MediaQuery.of(context).size.height * 0.4,
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
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    String? initialValue,
    required IconData prefixIcon,
    Widget? suffixIcon,
    required TextInputType keyboardType,
    bool obscureText = false,
    required bool isDark,
    required ColorScheme colors,
    required dynamic Function(String)? onChanged,
    required String? errorMessage,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: CustomTextFormField(
        initialValue: initialValue,
        label: label,
        // hint: hint,
        prefixIcon: Icon(prefixIcon, color: colors.primary),
        suffixIcon: suffixIcon,
        keyboardType: keyboardType,
        obscureText: obscureText,
        backgroundColor:
            isDark ? const Color(0xFF1E1E1E) : const Color(0xFFedf0f8),
        textColor: isDark ? Colors.grey[300] : Colors.black87,
        hintStyle: TextStyle(
          color: isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
          fontSize: 18.0,
        ),
        floatingLabelStyle: TextStyle(
          color: colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),

        // validator: validator,
        errorMessage: errorMessage,
        onChanged: onChanged,
      ),
    );
  }
}
