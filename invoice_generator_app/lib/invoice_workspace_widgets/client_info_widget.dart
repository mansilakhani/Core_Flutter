import 'package:flutter/material.dart';

Column client_Widget({
  required TextEditingController clientinfo_controller,
  required String hint_name,
  required String error_name,
  //required String client_data,
  required TextInputType type,
  required FormFieldSetter<String> onSave,
}) {
  return Column(
    children: [
      TextFormField(
        controller: clientinfo_controller,
        validator: (val) {
          if (val!.isEmpty) {
            return error_name;
          }
          return null;
        },
        onSaved: onSave,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint_name,
          hintStyle: const TextStyle(fontSize: 16),
        ),
      ),
      const SizedBox(height: 15)
    ],
  );
}
