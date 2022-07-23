

import 'package:flutter/material.dart';

class LogAuthTextField extends StatelessWidget {

  final String labelText;
  final bool? obscureText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? borderSideColor;
  
  const LogAuthTextField({ required this.labelText, 
  this.obscureText, 
  this.onChanged, this.validator,
  this.borderSideColor, 
  this.color,  
  });

  @override
  Widget build(BuildContext context) {
   return  TextFormField(
                    validator: validator,
                
                onChanged: onChanged,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: BorderSide(color:  Colors.grey.withOpacity(0.7),)
                  ),
                ),
              );
  }
}