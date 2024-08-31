import 'package:flutter/material.dart';
import 'package:menta_frontend/src/components/atoms/TextField.dart';

class FormFieldGroup extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const FormFieldGroup({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: firstNameController,
          labelText: 'First Name',
        ),
        SizedBox(height: 16),
        CustomTextField(
          controller: lastNameController,
          labelText: 'Last Name',
        ),
      ],
    );
  }
}
