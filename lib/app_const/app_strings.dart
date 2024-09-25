class AppStrings {
  static final AppStrings instance = AppStrings._internal();

  AppStrings._internal();

  factory AppStrings() => instance;
  static String appName = "Demo GetX";
  static String noInternetMsg = "Please check your internet connection";
  static String somethingWentWrong= "Something went wrong";
  static String serverNotRespond = "Server not responding!! Please try again later";
  static String fieldCanNotBeEmpty = "Field can't be empty";
  static String validEmailMsg = "Please enter valid email address";
  static String validFullNameMsg = "Please enter valid full name";

}
