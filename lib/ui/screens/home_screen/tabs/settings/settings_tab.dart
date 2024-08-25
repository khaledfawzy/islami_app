import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_friday_c9/providers/app_provider.dart';
import 'package:islami_friday_c9/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';
class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool darkModeSwitch = false;

  bool arModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of(context,listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.displayMedium,),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.darkMode, style: Theme.of(context).textTheme.displaySmall,),
              const Spacer(),
              Switch(value: darkModeSwitch, onChanged: (newValue){
                darkModeSwitch = newValue;
                   provider.setCurrentThemeMode(darkModeSwitch ? ThemeMode.dark: ThemeMode.light);
                },activeColor: AppColors.primiary,)
            ],
          ),
          Row(
            children: [
               Text("Enable Ar(العربية)", style:Theme.of(context).textTheme.displaySmall,),
              const Spacer(),
              Switch(value: arModeEnabled, onChanged: (newValue){
                arModeEnabled = newValue;
                if(arModeEnabled){
                  provider.setCurrentLocale("ar");
                }else {
                  provider.setCurrentLocale("en");
                }
              }, activeColor: AppColors.primiary,)
            ],
          )
        ],
      ),
    );
  }
}
