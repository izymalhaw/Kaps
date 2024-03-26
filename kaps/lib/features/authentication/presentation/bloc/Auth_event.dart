part of 'Auth_bloc.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String PhoneNumber;
  final String Password;
  SignInEvent({required this.PhoneNumber, required this.Password});
}

class SignUpEvent extends AuthEvent {
  final String FullName;
  final String PhoneNumber;
  final String Location;
  final File? ProfileImage;
  final Uint8List? fileBytes;
  final String? fileName;
  final String Password;
  SignUpEvent(this.FullName, this.PhoneNumber, this.Location, this.ProfileImage,
      this.fileBytes, this.fileName, this.Password);
}

class GetLocationEvent extends AuthEvent {
  GetLocationEvent();
}

class ProfileImagePickerEvent extends AuthEvent {
  ProfileImagePickerEvent();
}

class FilePickerEvent extends AuthEvent {
  FilePickerEvent();
}

class  AuthLogoutRequested extends AuthEvent{
  
}

class aggrementForm extends AuthEvent{}

/* class lang extends AuthEvent {
  final String l;
  lang(this.l);
} */
