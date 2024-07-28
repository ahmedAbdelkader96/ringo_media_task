

import 'package:task/features/lookups/models/country_lookups_model.dart';

import '../repository/repository.dart';

class LookupsController {
  final lookupsRepo = LookupsRepository();



  Future<List<CountryLookupsModel>> fetchCountries() {
    return lookupsRepo.fetchCountries();
  }


}
