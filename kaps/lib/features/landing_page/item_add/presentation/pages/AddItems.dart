import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaps/features/authentication/presentation/widgets/TextFields.dart';
import 'package:kaps/features/landing_page/item_add/presentation/bloc/add_items_bloc.dart';
import 'package:kaps/features/landing_page/item_add/presentation/widgets/ElevatedBtns.dart';
import 'package:kaps/features/landing_page/item_add/presentation/widgets/TextArea.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:status_alert/status_alert.dart';

class AddItems extends StatefulWidget {
  final String Phone;
  final String Location;
  const AddItems({super.key, required this.Phone, required this.Location});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  File? imageTemp;
  String? productName;
  String? productDescription;
  String? productPrice;
  String? location;
  String? quantity;
  String? PhoneNumber;
  String productCategory = "Vegitable";
  String? unit;
  List<String>? productType = [];
  bool check = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddItemsBloc>(context).add(getAllItems());
  }

  @override
  Widget build(BuildContext context) {
    double Sheight = MediaQuery.of(context).size.height;
    double Swidth = MediaQuery.of(context).size.width;
    List<String> items = ['Kg', 'Tons', 'Litters'];
    location = widget.Location;
    PhoneNumber = widget.Phone;
    String metrics;
    return BlocListener<AddItemsBloc, AddItemsState>(
      listener: (context, state) {
        if (state is loadingState) {
          CircularProgressIndicator();
        } else if (state is getAllItemsState) {
          state.data.forEach((element) {
            productType?.add(element['itemname']);
          });
          setState(() {
            check = false;
          });
        } else if (state is ImagePickerState) {
          setState(() {
            imageTemp = state.image;
          });
        } else if (state is netError) {
          StatusAlert.show(context,
              duration: Duration(seconds: 3),
              title: 'Error',
              subtitle: 'Network Error',
              configuration: const IconConfiguration(icon: Icons.error),
              maxWidth: Swidth * 0.7);
          Timer(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/AddItems");
          });
        } else if (state is ItemAdded) {
          StatusAlert.show(context,
              duration: Duration(seconds: 3),
              title: 'Success',
              subtitle: 'Item Added',
              configuration: const IconConfiguration(icon: Icons.check),
              maxWidth: Swidth * 0.7);
          Timer(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/home");
          });
        }
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<AddItemsBloc>(context).add(ImagePickerEvent());
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(Swidth * 0.2, 0, Swidth * 0.2, 0),
                child: Container(
                  height: Sheight * 0.2,
                  width: Swidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: imageTemp == null
                        ? Icon(
                            Icons.camera_alt_outlined,
                            size: Sheight * 0.1,
                          )
                        : Image.file(
                            imageTemp!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, Sheight * 0.05, Swidth * 0.5, 0),
              child: Text(
                'Item Details',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(Swidth * 0.05, 0, Swidth * 0.1, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: Sheight * 0.01,
                  ),
                  check == true
                      ? Text('Loading Items Please Wait')
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          child: DropdownButtonFormField(
                            value: productName,
                            hint: Text(
                              AppLocalizations.of(context)!.chooseProduct,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                productName = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                productName = value;
                              });
                            },
                            validator: (String? value) {},
                            items: (productType ?? []).map((String val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                  SizedBox(
                    height: Sheight * 0.01,
                  ),
                  TextArea(
                    icons: Icons.near_me,
                    onItemSelected: (value) {
                      setState(() {
                        productDescription = value;
                      });
                    },
                    hintText: AppLocalizations.of(context)!.productDesc,
                    checkValidity: (value) {},
                    obscurity: false,
                  ),
                  SizedBox(
                    height: Sheight * 0.01,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextArea(
                          icons: Icons.near_me,
                          onItemSelected: (value) {
                            quantity = value;
                          },
                          hintText:
                              AppLocalizations.of(context)!.productQuantity,
                          checkValidity: (value) {},
                          obscurity: false,
                        ),
                      ),
                      quantity == ""
                          ? SizedBox.shrink()
                          : Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.8 * 0.4,
                              child: DropdownButtonFormField<String>(
                                value: items[0],
                                items: items.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  metrics = newValue!;
                                  setState(() {
                                    if (metrics != null) {
                                      unit = metrics;
                                    }
                                    print(newValue);
                                  });
                                },
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, Sheight * 0.05, Swidth * 0.5, 0),
              child: Text(
                "Price Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(Swidth * 0.05, 0, Swidth * 0.1, 0),
              child: Column(
                children: [
                  TextArea(
                    icons: Icons.attach_money_sharp,
                    onItemSelected: (value) {
                      setState(() {
                        productPrice = value;
                      });
                    },
                    hintText: AppLocalizations.of(context)!.productPrice,
                    checkValidity: (value) {},
                    obscurity: false,
                  ),
                  SizedBox(
                    height: Sheight * 0.01,
                  ),
                  TextArea(
                    icons: Icons.location_on_outlined,
                    onItemSelected: (value) {},
                    hintText: location!,
                    checkValidity: (value) {},
                    obscurity: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 60,
                width: 325,
                child: ElevatedBtns(
                  PrimaryColor: Color.fromRGBO(215, 160, 34, 1),
                  SecondaryColor: Colors.grey,
                  TextDisplay: AppLocalizations.of(context)!.addItems,
                  Onpressed: () {
                    if (productDescription == null ||
                        productName == null ||
                        productPrice == null ||
                        productType == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("fill out the forms"),
                      ));
                    } else {
                      BlocProvider.of<AddItemsBloc>(context).add(
                        Add_items_event(
                          PhoneNumber!,
                          location!,
                          imageTemp!,
                          productName,
                          productDescription,
                          productPrice,
                          productCategory,
                          quantity,
                          unit,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
