import 'package:diesel_powered/features/image_picker/domain/data/image_picker_data_source.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickCameraImageUsecase implements Usecase<NoInput, String> {
  PickCameraImageUsecase({required ImagePickerHelper image}) : _image = image;
  final ImagePickerHelper _image;

  @override
  Future<String> call(NoInput imagePath) async {
    return _image.cameraImage();
  }
}
