
import 'dart:io';
import 'package:demo_empleados/src/data/global_preferences.dart';
import 'package:demo_empleados/src/widgets/alerts/snackbar_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demo_empleados/src/theme/theme.dart' as th;

class CustomDrawerController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();
  final ImagePicker picker = ImagePicker();
  XFile? _image;
  String? _imagePath;
  File? _savedImage;

  //? GETTERS
  GlobalPreferences get gxGlobalPrefs => _globalPreferences;
  XFile? get gxImage      => _image;
  String? get gxImagePath => _imagePath;
  File? get gxSavedImage  => _savedImage;

  showAdaptativeModals(BuildContext _context) {

    if(Platform.isIOS) {
      showCupertinoModalPopup(
        context: _context, 
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Camara'),
              onPressed: _imageCamera,
            ),
            CupertinoActionSheetAction(
              child: const Text('Galería'),
              onPressed: _imageGallery,
            )
          ],
        )
      );
    }else {
      showModalBottomSheet(
        context: _context,
        builder: (_context) {
          return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap:  _imageCamera,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera, color: th.primaryColor),
                  const SizedBox(width: 10.0),
                  const Text('Camara'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: _imageGallery,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, color: th.primaryColor),
                  const SizedBox(width: 10.0),
                  const Text('Galería'),
                ]
              )
            ),
          )
          ]
        );
        }
      );
    }
  }

  //==========================================================
  /// ACCEDE A LA GALERÍA
  //==========================================================
  Future<void> _imageGallery() async {
    Get.back(closeOverlays: true);
    try{
      _image = await picker.pickImage(source: ImageSource.gallery);
      _imagePath = _image!.path;
      _savedImage = File(_imagePath!);
      _globalPreferences.imagePath = _imagePath;
      update(['image']);
    } catch(e){
      SnackBarAlert.cSnackBar(Icons.image_not_supported_outlined, 'No seleccionaste ninguna imagen');
    }
  }

  //==========================================================
  /// CAPTURA UNA FOTO
  //==========================================================
  Future<void> _imageCamera() async {
    Get.back(closeOverlays: true);
    try{
      _image = await picker.pickImage(source: ImageSource.camera);
      _imagePath = _image!.path;
      _savedImage =  File(_imagePath!);
      _globalPreferences.imagePath = _imagePath;
      update(['image']);
    } catch(e){
      SnackBarAlert.cSnackBar(Icons.image_not_supported, 'No seleccionaste ninguna foto');
    }
  }

  
}