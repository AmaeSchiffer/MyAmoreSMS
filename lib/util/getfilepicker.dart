import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class GetFilePicker {
  Future<void> getPathFile() async {
    var smsStatus = await Permission.storage.status;
    if (!smsStatus.isGranted) await Permission.storage.request();
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'xls',
        'xlsx',
      ],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }
}
