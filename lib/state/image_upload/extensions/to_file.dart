import 'dart:io';

import 'package:image_picker/image_picker.dart';

//XFileからFileに変換するextension
extension ToFile on Future<XFile?> {
  Future<File?> toFile() => then((xFile) => xFile?.path)
      .then((filePath) => filePath != null ? File(filePath) : null);
}
