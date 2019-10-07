import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:image_picker_extended/image_picker_extended.dart';

class BuyProductProvider extends ChangeNotifier {
  // Dependencies
  final _imagePickerExtends = ImagePickerExtends();

  // Certificated image
  File _selectedImage1;
  File _selectedImage2;

  File get selectedImage1 => _selectedImage1;
  File get selectedImage2 => _selectedImage2;

  set selectedImage1(File image1) {
    _selectedImage1 = image1;
    notifyListeners();
  }

  set selectedImage2(File image2) {
    _selectedImage2 = image2;
    notifyListeners();
  }

  Future openCamera1(BuildContext context) async {
    selectedImage1 = await _imagePickerExtends.chooseCamera(context);
  }

  Future openGallery1(BuildContext context) async {
    selectedImage1 = await _imagePickerExtends.chooseGallery(context);
  }

  Future openCamera2(BuildContext context) async {
    selectedImage2 = await _imagePickerExtends.chooseCamera(context);
  }

  Future openGallery2(BuildContext context) async {
    selectedImage2 = await _imagePickerExtends.chooseGallery(context);
  }
}
