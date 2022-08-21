import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Business Info Widget :-
Column business_Widget({
  required TextEditingController businessinfo_controller,
  required String hint_name,
  required String error_name,
  required TextInputType type,
  required Null Function(dynamic val) onSave,
}) {
  return Column(
    children: [
      TextFormField(
        controller: businessinfo_controller,
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
