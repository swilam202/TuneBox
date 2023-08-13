import 'dart:typed_data';

import 'package:flutter/material.dart';

ImageProvider getImage(Uint8List? image) {
  if (image != null) {
    return MemoryImage(image);
  } else {
    return const AssetImage('assets/images/music.png');
  }
}
