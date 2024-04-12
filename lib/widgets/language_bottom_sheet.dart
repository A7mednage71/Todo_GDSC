import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/my_app_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyAppProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: Row(
                children: [
                  Text('English'),
                  Spacer(),
                  provider.language == 'en'
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.circle_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: Row(
                children: [
                  Text('Arabic'),
                  Spacer(),
                  provider.language == 'ar'
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.circle_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
