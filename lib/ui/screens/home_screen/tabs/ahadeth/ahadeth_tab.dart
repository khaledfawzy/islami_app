import 'package:flutter/material.dart';
import 'package:islami_friday_c9/model/sura_details_args.dart';
import 'package:islami_friday_c9/ui/screens/sura_details_screen/sura_details_screen.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class AhadethTab extends StatelessWidget {
  final List<String> ahadethNames = List.generate(50,
      (index) => "${index + 1} الحديث");

  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 35, child: Image.asset(AppAssets.ahadethLogo)),
          const SizedBox(height: 4),
          const Divider(color: AppColors.accent, thickness: 2),
          const Text(
            "Hadeth name",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: AppColors.accent,
                fontWeight: FontWeight.w600),
          ),
          const Divider(color: AppColors.accent, thickness: 2),
          Expanded(
            flex: 65,
            child: ListView.separated(
              itemCount: ahadethNames.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: SuraDetailsArgs(
                          ahadethNames[index], "h${index + 1}.txt", false),
                    );
                  },
                  child: Text(
                    ahadethNames[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        color: AppColors.accent,
                        fontWeight: FontWeight.w400),
                  ),
                );
              },
              separatorBuilder: (_, __) =>
                  const Divider(color: AppColors.accent, thickness: 2),
            ),
          )
        ],
      ),
    );
  }
}
