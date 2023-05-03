import 'dart:io';
import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';

Future<File?> downloadFile(String url, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File('${appStorage.path}/$name');
  try {
    final response = await Dio().get(
      url,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0),
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  } on Exception catch (e) {
    print(e);
    return null;
  }
}


