part of 'Auth_bloc.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class AuthenticatedState extends AuthState {
  final dynamic farmerEntity;
  AuthenticatedState(this.farmerEntity);
}

class ErrorAuthenticationState extends AuthState {
  final dynamic error;
  ErrorAuthenticationState(this.error);
}

class FoundLocationState extends AuthState {
  final String Address;
  FoundLocationState(this.Address);
}

class LocationLoadingState extends AuthState {}

class FoundProfileImageState extends AuthState {
  File? image;
  FoundProfileImageState(this.image);
}

class ImageError extends AuthState {}

class FilePickerState extends AuthState {
  Uint8List fileBytes;
  String fileName;
  FilePickerState(this.fileBytes, this.fileName);
}

class FileError extends AuthState {}

class LoggedOut extends AuthState {}

/* class langState extends AuthState {
  final String l;
  langState(this.l);
} */
