import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class DefaultPhoneFormField extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? border;
  final String? hintText;

  const DefaultPhoneFormField(
      {Key? key,
        required this.controller,
        this.border = const OutlineInputBorder(borderSide: BorderSide(width: 20)),
        this.hintText = 'Eg. 1552468326'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: CountryCodePicker(
              onChanged: print,
              initialSelection: 'EG',
              favorite: const ['+20', 'EG'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,

            ),
            //isDense: true,
            border: border,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          //  hintTextDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}