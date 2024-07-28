import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/features/lookups/models/country_lookups_model.dart';

class GeneralPhoneTextFormField extends StatelessWidget {
  const GeneralPhoneTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    required this.countryLookupsModel,
    required this.onTapCountry,
    required this.maxLength,
  });
  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final CountryLookupsModel countryLookupsModel;
  final Function() onTapCountry;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191D2B)),
      keyboardType: Platform.isIOS
          ? const TextInputType.numberWithOptions(signed: true, decimal: true)
          : TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      validator: validator,
      controller: controller,
      cursorColor: const Color(0xFF191D2B),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8EAEE), width: 1.5)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8EAEE), width: 1.5)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8EAEE), width: 1.5)),
        isDense: true,
        counterText: "",
        hintText: hintText,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF96A0B5)),
        prefixIcon: InkWell(
          onTap: onTapCountry,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 30,
            width: 35,
            color: Colors.transparent,
            child: Center(
              child: Image.asset(
                'assets/countries_flags/${countryLookupsModel.topLevelDomain}.png',
                width: 35,
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
