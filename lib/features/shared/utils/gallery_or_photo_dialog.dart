import 'package:flutter/material.dart';

Future<void> showGalleryOrPhotoDialog(
  BuildContext context,
  VoidCallback pickImage,
  VoidCallback takePhoto,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      return AlertDialog(
        title: const Text(
          'Selecciona una opción',
          style: TextStyle(fontSize: 17),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galería'),
              onTap: () {
                Navigator.pop(context);
                pickImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Cámara'),
              onTap: () {
                Navigator.pop(context);
                takePhoto();
              },
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: theme.dialogBackgroundColor,
      );
    },
  );
}
