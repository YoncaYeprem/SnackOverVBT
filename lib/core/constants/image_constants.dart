class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    _instace ??= ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  //Splash
  final String loginTittle = 'image/login_tittle'.toPNG;

  //Onboard
  final String ask = 'image/ask'.toPNG;
  final String people = 'image/people'.toPNG;
  final String think = 'image/think'.toPNG;
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/$this.png';
  String get toJPEG => 'assets/$this.jpeg';
  String get toJSON => 'assets/$this.json';
  String get toSVG => 'assets/$this.svg';
}
