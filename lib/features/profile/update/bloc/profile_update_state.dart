part of 'profile_update_bloc.dart';
enum FormStatus { invalid, valid, validating, posting, success, failure, }
class ProfileUpdateState extends Equatable {
  final Username name;
  final Username lastname;
  final Phone phone;
  // final GlobalKey<Formstate>? formKey;
  final bool isValid;
  final File? image;
  final FormStatus formStatus;
  final Resource? response;

  const ProfileUpdateState({
    this.name = const Username.pure(),
    this.lastname = const Username.pure(),
    this.phone = const Phone.pure(),
    this.isValid = false,
    this.image,
    this.formStatus = FormStatus.invalid,
    this.response
  });

  // toUser() => User(
  //   name: name.value, 
  //   lastname: lastname.value, 
  //   phone: phone.value
  // );

  ProfileUpdateState copyWith({
    Username? name,
    Username? lastname,
    Phone? phone,
    bool? isValid,
    File? image,
    FormStatus? formStatus,
    Resource? response,
  }) => ProfileUpdateState(
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    phone: phone ?? this.phone,
    isValid: isValid ?? this.isValid,
    image: image ?? this.image,
    formStatus: formStatus ?? this.formStatus,
    response: response,
  );

  @override
  List<Object?> get props => [name, lastname, phone, isValid, image, formStatus, response];
}
