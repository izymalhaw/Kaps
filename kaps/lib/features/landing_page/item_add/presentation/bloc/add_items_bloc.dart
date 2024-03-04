import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/item_add/domain/usecases/add_item.dart';

part 'add_items_event.dart';
part 'add_items_state.dart';

class AddItemsBloc extends Bloc<AddItemsEvent, AddItemsState> {
  final AddItemsUseCase _addItemsUseCase;
  AddItemsBloc(this._addItemsUseCase) : super(AddItemsInitial()) {
    on<AddItemsEvent>((event, emit) {});
    on<Add_items_event>((event, emit) async {
      dynamic res = await _addItemsUseCase.AddItems(
        event.PhoneNumber,
        event.Location,
        event.ProductImage,
        event.ProductName,
        event.ProductDescription,
        event.price,
      );
      if (res is DataSuccess) {
        emit(ItemAdded());
      } else {
        emit(netError());
      }
    });
    on<ImagePickerEvent>((event, emit) async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        emit(ImagePickerState(imageTemp));
      } on PlatformException catch (e) {
        emit(ImageError());
      }
    });
    on<getAllItems>((event, emit) async {
      try {
        emit(loadingState());
        DataState<List<dynamic>> res = await _addItemsUseCase.getAllItem();
        if (res is DataSuccess) {
          emit(getAllItemsState((res.data!)));
        } else {
          print("error");
        }
      } on PlatformException catch (e) {}
    });
  }
}
