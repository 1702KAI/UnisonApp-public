class Validator {
  static String? validateField(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty'; // Return an error message with the field name
    }

    final RegExp regex = RegExp(r"^[a-zA-Z-' ]+$");

    switch (fieldName) {
      case 'First Name'||'Last Name':
        if (!regex.hasMatch(value)) {
          return 'Invalid $fieldName format'; // Return an error message with the field name
        }
        break;
      case 'Email':
        final emailRegExp = RegExp(r'^\S+@\S+\.\S+$');
        if (!emailRegExp.hasMatch(value)) {
          return 'Invalid $fieldName format'; // Return an error message with the field name
        }
        break;
      case 'Phone Number':
        final phoneRegExp = RegExp(r'^\d{10}$');
        if (!phoneRegExp.hasMatch(value)) {
          return 'Invalid $fieldName format'; // Return an error message with the field name
        }
        break;
      case 'Text':
        final textRegExp = RegExp(r'^[A-Za-z\s]+$');
        if (!textRegExp.hasMatch(value)) {
          return 'Invalid $fieldName format'; // Return an error message with the field name
        }
        break;
      case 'Number':
        final numberRegExp = RegExp(r'^\d+$');
        if (!numberRegExp.hasMatch(value)) {
          return 'Invalid $fieldName format'; // Return an error message with the field name
        }
        break;
      case 'Bank Account Number':
        final bankAccountRegExp = RegExp(r'^\d{10}$'); // Adjust the pattern as needed
        if (!bankAccountRegExp.hasMatch(value)) {
          return 'Invalid $fieldName format'; // Return an error message with the field name
        }
        break;
      // Add more cases for other fields as needed
    }

    return null; // Validation passed
  }

  // // Updated methods to use validateField
  // static String? isValidName(String? value) {
  //   return validateField('First Name', value);
  // }

  // static String? isValidEmail(String? value) {
  //   return validateField('Email', value);
  // }

  // static String? isValidPhoneNumber(String? value) {
  //   return validateField('Phone Number', value);
  // }

  // static String? containsOnlyText(String? value) {
  //   return validateField('Text', value);
  // }

  // static String? containsOnlyNumbers(String? value) {
  //   return validateField('Number', value);
  // }

  // static String? isValidBankAccountNumber(String? value) {
  //   return validateField('Bank Account Number', value);
  // }
}
