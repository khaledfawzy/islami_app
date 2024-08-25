import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_friday_c9/model/sura_details_args.dart';
import 'package:islami_friday_c9/ui/utils/app_assets.dart';
import 'package:islami_friday_c9/ui/utils/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = "sura_details";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      if (args.isQuranFile) {
        readQuranFile(args.fileName);
      } else {
        readHadethFile(args.fileName);
      }
    }
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
        child: Scaffold(
          appBar: buildAppBar(args.suraName, args.isQuranFile),
          backgroundColor: AppColors.transparent,
          body: fileContent.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(16),
                        height: MediaQuery.of(context).size.height * .7,
                        child: SingleChildScrollView(
                          child: Text(
                            fileContent,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 24,
                              color: AppColors.accent,
                            ),
                          ),
                        ),
                      )),
                ),
        ));
  }

  PreferredSizeWidget buildAppBar(String suraName, bool isQuran){
      return AppBar(
        centerTitle: true,
        title: isQuran ? Text(suraName,
            style: const TextStyle(
                fontSize: 30,
                color: AppColors.accent,
                fontWeight: FontWeight.bold)) : null,
        backgroundColor: AppColors.transparent,
        elevation: 0);
    }

  void readQuranFile(String fileName) {
    Future<String> futureFileContent =
        rootBundle.loadString("assets/files/$fileName");
    futureFileContent.then((file) {
      List<String> fileLines = file.split("\n");

      for (int i = 0; i < fileLines.length; i++) {
        fileLines[i] = "${fileLines[i]}(${i + 1})";
        print(fileLines[i]);
      }
      //print(fileLines);
      fileContent = fileLines.join();
      setState(() {});
    });
  }

  void readHadethFile(String fileName) {
    Future<String> futureFileContent =
        rootBundle.loadString("assets/files/ahadeth/$fileName");
    futureFileContent.then((file) {
      fileContent = file;
      setState(() {});
    });
  }
}
