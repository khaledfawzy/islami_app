import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_friday_c9/model/sura_details_args.dart';
import 'package:islami_friday_c9/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:islami_friday_c9/ui/utils/app_assets.dart';
import 'package:islami_friday_c9/ui/utils/app_colors.dart';
import 'package:islami_friday_c9/ui/utils/constants.dart';
class QuranTab extends StatelessWidget {
  const QuranTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded( flex: 35,child: Image.asset(AppAssets.quranLogo,)),
          const SizedBox(height: 4,),
          const Divider(color: AppColors.accent, thickness: 2,),
          Text(AppLocalizations.of(context)!.suraName,
            textAlign: TextAlign.center,
           style: Theme.of(context).textTheme.bodyMedium,),
          const Divider(color: AppColors.accent, thickness: 2,),
          Expanded(flex: 65,
           child: ListView.separated(
             itemCount: Constants.suraNames.length,
               itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                      arguments: SuraDetailsArgs(Constants.suraNames[index],
                           "${index+1}.txt", true));
                  },
                  child: Text(Constants.suraNames[index],
                   textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25, color: AppColors.accent, fontWeight: FontWeight.w400),),
                );
               },
               separatorBuilder: (_, __) =>  const Divider(color: AppColors.accent, thickness: 2,),
           ),)
        ],
      ),
    );
  }
}