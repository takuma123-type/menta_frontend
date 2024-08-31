import 'package:menta_frontend/src/infrastructure/repositories/UsersRepository.dart';
import 'package:menta_frontend/src/infrastructure/repositories/errors.dart';

class CreateUserInput {
  final String firstName;
  final String lastName;

  CreateUserInput({required this.firstName, required this.lastName});

  bool isValid() {
    return firstName.isNotEmpty && lastName.isNotEmpty;
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}

class CreateUserUsecase {
  final UsersRepository usersRepository;

  CreateUserUsecase({required this.usersRepository});

  Future<void> execute(CreateUserInput input) async {
    if (!input.isValid()) {
      throw InvalidParameterError();
    }

    try {
      await usersRepository.create(input.toMap());
    } catch (error) {
      if (error is UnauthorizedError) {
        throw FailSignUpError;
      } else {
        throw FailSignUpError;
      }
    }
  }
}
