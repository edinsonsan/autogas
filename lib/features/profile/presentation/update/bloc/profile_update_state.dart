part of 'profile_update_bloc.dart';

enum FormStatus { invalid, valid, validating, posting, success, failure }

class ProfileUpdateState extends Equatable {
  final int id;
  final Username name;
  final Username lastname;
  final Phone phone;
  // final GlobalKey<Formstate>? formKey;
  final bool isValid;
  final File? image;
  final FormStatus formStatus;
  final Resource? response;

  const ProfileUpdateState({
    this.id = 0,
    this.name = const Username.pure(),
    this.lastname = const Username.pure(),
    this.phone = const Phone.pure(),
    this.isValid = false,
    this.image,
    this.formStatus = FormStatus.invalid,
    this.response,
  });

  toUser() => User(
    name: name.value,
    lastname: lastname.value,
    phone: phone.value
  );

  ProfileUpdateState copyWith({
    int? id,
    Username? name,
    Username? lastname,
    Phone? phone,
    bool? isValid,
    File? image,
    FormStatus? formStatus,
    Resource? response,
  }) => ProfileUpdateState(
    id: id ?? this.id,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    phone: phone ?? this.phone,
    isValid: isValid ?? this.isValid,
    image: image ?? this.image,
    formStatus: formStatus ?? this.formStatus,
    response: response,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    lastname,
    phone,
    isValid,
    image,
    formStatus,
    response,
  ];
}
