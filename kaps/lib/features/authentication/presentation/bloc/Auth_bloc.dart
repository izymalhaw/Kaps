import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaps/features/authentication/data/data_sources/remote/get_farmer_data_api_service.dart';
import 'package:kaps/features/authentication/data/model/farmer_model.dart';
import 'package:kaps/features/authentication/domain/entites/farmer_entity.dart';
import 'package:kaps/features/authentication/domain/usecases/get_farmer_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/resources/data_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

part 'Auth_event.dart';
part 'Auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetFarmerDataUseCase _getFarmerDataUseCase;
  AuthBloc(this._getFarmerDataUseCase) : super(InitialAuthState()) {
    on<SignInEvent>(
      (event, emit) async {
        emit(LoadingAuthState());
        dynamic res = await _getFarmerDataUseCase.SignIn(
            event.PhoneNumber, event.Password);
        if (res is DataSuccess) {
          return emit(AuthenticatedState(res.data[0]));
        } else if (res is DataFailed) {
          return emit(ErrorAuthenticationState(res.error));
        } else {
          return emit(ErrorAuthenticationState(res.error));
        }
      },
    );
    on<aggrementForm>(
      (event, emit) {
        emit(AggrementInitialized());
      },
    );

    on<SignUpEvent>((event, emit) async {
      emit(LoadingAuthState());
      dynamic res = await _getFarmerDataUseCase.SignUp(
          event.FullName,
          event.PhoneNumber,
          event.Location,
          event.ProfileImage,
          event.fileBytes,
          event.fileName,
          event.Password);
      if (res is DataSuccess) {
        print(res.data.toString());
        return emit(AuthenticatedState(res.data));
      } else if (res is DataFailed) {
        print(res.error.toString());
        return emit(ErrorAuthenticationState(res.error));
      } else {
        return emit(ErrorAuthenticationState(res.error));
      }
    });

    on<GetLocationEvent>(
      (event, emit) async {
        Geolocator.requestPermission();
        Geolocator.checkPermission();
        emit(LocationLoadingState());
        try {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
          List<Placemark> placemarks = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          final address = "${placemarks[0].locality}";
          print(placemarks[0].locality.toString());
          emit(FoundLocationState(address));
        } catch (e) {
          emit(ErrorAuthenticationState(e));
        }
      },
    );
    on<ProfileImagePickerEvent>(
      (event, emit) async {
        try {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image == null) return;
          final imageTemp = File(image.path);
          emit(FoundProfileImageState(imageTemp));
        } on PlatformException catch (e) {
          emit(ImageError());
        }
      },
    );
    on<FilePickerEvent>(
      (event, emit) async {
        try {
          FilePickerResult? files = await FilePicker.platform.pickFiles(
            withData: true,
/*             type: FileType.custom,
            allowedExtensions: ['pdf', 'docx', 'doc', 'txt'], */
          );
          if (files != null) {
            PlatformFile file = files.files.first;
            emit(FilePickerState(file.bytes!, file.name));
          }
        } on PlatformException catch (e) {
          emit(FileError());
        }
      },
    );
    on<AuthLogoutRequested>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(LoggedOut());
    });
/*     on<lang>(
      (event, emit) {
        emit(langState(event.l));
        print(event.l);
      },
    ); */
  }
}
