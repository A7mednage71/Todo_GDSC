import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/my_app_provider.dart';
import 'package:todo_app/res/app_colors.dart';
import 'package:todo_app/widgets/language_bottom_sheet.dart';
import 'package:todo_app/widgets/theme_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyAppProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context)!.language)),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        provider.language == 'en' ?
                         Text(AppLocalizations.of(context)!.english) : Text(AppLocalizations.of(context)!.arabic),
                        GestureDetector(
                            onTap: () {
                              showLanguageBottomSheet(context);
                            },
                            child: const Icon(Icons.arrow_drop_down_outlined)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Align(alignment: Alignment.centerLeft, child: Text(AppLocalizations.of(context)!.mode)),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Light'),
                        GestureDetector(
                            onTap: () {
                              showThemeBottomSheet(context);
                            },
                            child: const Icon(Icons.arrow_drop_down_outlined)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}
