import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageUtil {
  static Future<File> getImageFile(String url)async{
    var file = await DefaultCacheManager().getSingleFile(url);
    return file;
  }
}