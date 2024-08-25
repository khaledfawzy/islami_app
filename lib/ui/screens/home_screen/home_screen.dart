import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_friday_c9/providers/app_provider.dart';
import 'package:islami_friday_c9/ui/screens/home_screen/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_friday_c9/ui/screens/home_screen/tabs/quran/quran_tab.dart';
import 'package:islami_friday_c9/ui/screens/home_screen/tabs/radio/radio_tab.dart';
import 'package:islami_friday_c9/ui/screens/home_screen/tabs/sebha/sebha_tab.dart';
import 'package:islami_friday_c9/ui/screens/home_screen/tabs/settings/settings_tab.dart';
import 'package:islami_friday_c9/ui/utils/app_assets.dart';
import 'package:islami_friday_c9/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of(context);
    return Container(
        decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    provider.currentMode == ThemeMode.light?
                    AppAssets.background: AppAssets.darkBackground), fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(AppLocalizations.of(context)!.islami),
              backgroundColor: AppColors.transparent,
              elevation: 0),
          backgroundColor: AppColors.transparent,
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor:provider.currentMode == ThemeMode.light?
              AppColors.primiary: AppColors.primiaryDark),
            child: BottomNavigationBar(
              onTap: (index){
                currentIndex = index;
                setState(() {});
              },
              currentIndex: currentIndex,
              items: [
                buildBottomNavigationItem(imagePath: AppAssets.icQuran, label: "Quran"),
                buildBottomNavigationItem(imagePath: AppAssets.icAhadeth, label: "Ahadeth"),
                buildBottomNavigationItem(imagePath: AppAssets.icSebha, label: "Sebha"),
                buildBottomNavigationItem(imagePath: AppAssets.icRadio, label: "Radio"),
                buildBottomNavigationItem(iconData: Icons.settings, label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
        ));
  }

  BottomNavigationBarItem buildBottomNavigationItem({
    IconData? iconData,
    String imagePath = "",
    required String label}) =>
      BottomNavigationBarItem(icon:iconData == null?
      ImageIcon(AssetImage(imagePath)): Icon(iconData), label: label);
}
