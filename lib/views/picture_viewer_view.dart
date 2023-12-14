import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:picture_360_viewer/widgets/appbar_leading.dart';

class PictureViewerView extends StatelessWidget {
  const PictureViewerView({super.key, required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viewer'),
        backgroundColor: theme.primary,
        elevation: 0,
        centerTitle: true,
        leading: AppBarLeading(
          color: theme.onBackground,
          backgroundColor: theme.background,
          borderColor: theme.background,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Panorama(
          key: UniqueKey(),
          child: Image.network(imageURL),
        ),
      ),
    );
  }
}
