import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
   AuthTextFormField(
      {Key? key,
      required this.controller,
      this.isPassword = false,
      this.textInputType = TextInputType.text,
      required this.validator ,
      this.prefix ,
      this.suffix ,
      required this.hint
      })
      : super(key: key);

  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textInputType;
  final Function(String?) validator;
  Widget? prefix;
  Widget? suffix;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: const TextStyle(
            color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
