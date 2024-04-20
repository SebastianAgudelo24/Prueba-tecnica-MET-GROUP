class AppImages {
  static final _singleton = AppImages._internal();
  factory AppImages() => _singleton;

  AppImages._internal();
  static const _kPath = "assets/images";

  static const onBoarding = "$_kPath/onBoarding.png";
  static const register = "$_kPath/register.png";
  static const avatar = "$_kPath/avatar.png";
  static const banner = "$_kPath/banner.png";
  static const error = "$_kPath/error.png";
  static const noWifi = "$_kPath/noWifi.png";
  static const delete = "$_kPath/delete.png";
}
