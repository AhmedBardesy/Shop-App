// ignore_for_file: unnecessary_null_comparison, must_be_immutable, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class customTextFromField extends StatelessWidget {
  customTextFromField(
      {@required this.sufficOnpressed,
      @required this.labelText,
      @required this.iconprefix,
      @required this.formKey,
      @required this.onchange,
      @required this.keyboartype,
      @required this.Sufixicon,
      @required this.controller});
  final VoidCallback? sufficOnpressed;
  final String? labelText;
  final IconData? iconprefix;
  final IconData? Sufixicon;
  final TextEditingController? controller;
 final void Function(String)? onchange;
 final GlobalKey<FormState>? formKey;
 final TextInputType? keyboartype;
 var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      onChanged: onchange,
      // obscureText: visibality,
      controller: controller,
      decoration: InputDecoration(
          suffix: IconButton(
            icon: Icon(Sufixicon),
            onPressed: sufficOnpressed,
          ),
          
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          labelText: labelText,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(16),
          ),
          prefix: Icon(
            iconprefix,
            color: const Color.fromARGB(255, 0, 0, 0),
          )),
      keyboardType: keyboartype,
    
     validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter all fields';
                        }
                        return null; // Return null if validation passes
                      },
    );
  }
}
