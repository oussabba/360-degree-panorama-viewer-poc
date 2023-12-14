import 'package:flutter/material.dart';
import 'package:picture_360_viewer/views/picture_viewer_view.dart';
import 'package:picture_360_viewer/widgets/app_button.dart';
import 'package:picture_360_viewer/widgets/app_text_field.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TextEditingController _linkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submit(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              PictureViewerView(imageURL: _linkController.text),
        ),
      );
      // _linkController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text('360 pictures viewer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                hintText: 'Le lien',
                borderRadius: BorderRadius.circular(10),
                controller: _linkController,
                type: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un lien';
                  }
                  return null;
                },
              ),
              AppButton(
                  textButton: 'Voir',
                  width: 200,
                  borderRadius: BorderRadius.circular(13),
                  backgroundColor: theme.primary,
                  margin: const EdgeInsets.only(top: 20),
                  onTap: () {
                    _submit(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
