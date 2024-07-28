
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/lookups/models/country_lookups_model.dart';
import 'package:task/features/lookups/repository/irepository.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';

class LookupsRepository
    implements ILookupsRepository {
  final supabase = Supabase.instance.client;





  @override
  Future<List<CountryLookupsModel>> fetchCountries() async {
    final data = await supabase.from(Constants.countriesLookupTable).select('*');
    return data.map((item) => CountryLookupsModel.fromJson(item)).toList();
  }





}
