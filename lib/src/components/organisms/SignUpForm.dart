import 'package:flutter/material.dart';
import 'package:menta_frontend/src/components/molecules/FormField.dart';
import 'package:menta_frontend/src/components/atoms/Button.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final VoidCallback onSignUp;

  const SignUpForm({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.onSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormFieldGroup(
          firstNameController: firstNameController,
          lastNameController: lastNameController,
        ),
        SizedBox(height: 24),
        CustomButton(
          text: '新規登録',
          onPressed: onSignUp,
        ),
      ],
    );
  }
}
