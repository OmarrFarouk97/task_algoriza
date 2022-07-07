import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChange,
  required validator,
   String? label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword =false,
  suffixPressed,
  onTab,

})=> TextFormField(

  controller:controller ,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap:onTab,
  validator: validator,
  decoration: InputDecoration(

    labelText: label,
    prefixIcon: Icon(
        prefix
    ),
    suffixIcon: suffix != null? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
          suffix
      ),
    ) : null,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15)
    ),
  ),
);