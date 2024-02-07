import 'package:shared_preferences/shared_preferences.dart';

class LocalizationHelper {
  static Future<void> setLocale(String currentLocale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("locale", currentLocale);
  }

  static Future<String> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = prefs.getString("locale") ?? "";

    return val;
  }
}

String statusConverter(String status) {
  switch (status) {
    case "Status.ALIVE":
      return "Живой";
    case "Status.DEAD":
      return "Мёртвый";
    default:
      return "Неизвестно";
  }
}

int statusColorConverter(String status) {
  switch (status) {
    case "Status.ALIVE":
      return 0xFF27AE60;
    case "Status.DEAD":
      return 0xFFEB5757;
    default:
      return 0xFF828282;
  }
}

String speciesConverter(String species) {
  switch (species) {
    case "Species.HUMAN":
      return "Человек";
    default:
      return "Пришелец";
  }
}

String genderConverter(String gender) {
  switch (gender) {
    case "Gender.MALE":
      return "Мужской";
    case "Gender.FEMALE":
      return "Женский";
    default:
      return "Неизвестно";
  }
}

