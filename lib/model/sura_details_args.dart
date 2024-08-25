class SuraDetailsArgs{
  String suraName;
  String fileName;
  bool isQuranFile;

  SuraDetailsArgs(this.suraName, this.fileName, this.isQuranFile);

  @override
  String toString() {
    return "Filename :$fileName, suraName: $suraName";
  }
}