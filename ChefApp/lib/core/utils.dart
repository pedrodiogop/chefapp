import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
 
void showSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()..
  showSnackBar
  (SnackBar(content: Text(text),),);
}
// serve para adicionar uma imagem da galeria do usuario 
// para a firebase
// mudar o final do INFO.list
Future<FilePickerResult?> pickImage() async {
  final image = await FilePicker.platform.pickFiles(type: FileType.image);

  return image;
}