import 'package:task/features/lookups/models/country_lookups_model.dart';

class Constants {
  static String get usersTable => 'users';

  static String get userIdColumn => 'user_id';

  static String get countriesLookupTable => 'countries_lookups';

  static CountryLookupsModel get defaultCountryModel => CountryLookupsModel(
      countryId: 53,
      iso2: "EG",
      dialCode: "+20",
      nameEn: "Egypt",
      nameAr: "مصر",
      nationalityAr: "مصري",
      nationalityEn: "Egyptian",
      topLevelDomain: "eg");

  static RegExp get emailRegExp => RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
