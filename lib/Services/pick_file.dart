import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tecbloc/controller/file_controller.dart';

Future pickFile() async {
  FilePicKerController filePicKerController = Get.put(FilePicKerController());
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  filePicKerController.file.value = result!.files.first;
}
