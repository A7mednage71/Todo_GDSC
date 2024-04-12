import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/my_app_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Row(
                children: [
                  const Text('Dark'),
                  const Spacer(),
                  provider.theme == ThemeMode.dark
                      ? const Icon(Icons.check_circle_outline)
                      : const Icon(Icons.circle_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: Row(
                children: [
                  const Text('Light'),
                  const Spacer(),
                  provider.theme == ThemeMode.light
                      ? const Icon(Icons.check_circle_outline)
                      : const Icon(Icons.circle_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                provider.changeTheme(ThemeMode.system);
              },
              child: Row(
                children: [
                  const Text('System'),
                  const Spacer(),
                  provider.theme == ThemeMode.system
                      ? const Icon(Icons.check_circle_outline)
                      : const Icon(Icons.circle_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }
}
