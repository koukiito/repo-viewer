import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  static Future _showLicense(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();
    if (context.mounted) {
      showLicensePage(
        context: context,
        applicationVersion: info.version,
        applicationName: 'Repo Viewer',
        applicationLegalese: 'Kouki Ito',
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.settings),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showLicense(context);
                  },
                  child: Text(L10n.of(context)!.show_license),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
