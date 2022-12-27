class TextFieldValidator {
  /// This validator TextFormField that required only text
  String? password;

  get forTextOnly => (String? value) {
        if (value!.isEmpty) {
          return 'required';
        } else {
          return null;
        }
      };

  get forEmailOnly => (String? value) {
        if (value!.isEmpty) {
          return "*email is required";
        } else if (!value.contains("@")) {
          return "*invalid email address";
        } else if (value.split("@")[0] == "" && value.split("@")[1] == "") {
          return "*invalid email address";
        } else if (value.split("@")[0] == "" || value.split("@")[1] == "") {
          return "invalid email address";
        } else {
          return null;
        }
      };

  get forPassword => (String? value) {
        password = value;
        if (value!.isEmpty) {
          return 'required';
        } else if (value.length <= 7) {
          return 'password must be at least 8 characters';
        } else {
          return null;
        }
      };

  get forConfirmPassword => (String? value) {
        if (value!.isEmpty) {
          return 'required';
        } else if (value != password) {
          return 'password dismatched';
        } else {
          return null;
        }
      };

  get forPhoneNumber => (String? value) {
        if (value!.isEmpty) {
          return "Phone number required";
        } else if (value.length > 15) {
          return "Invalid phone number";
        } else if (value.contains(RegExp(r'[A-Z]'))) {
          return "Invalid phone number";
        } else {
          return null;
        }
      };

  get forPreferName => (String? value) {
        if (value!.isEmpty) {
          return "required";
        } else {
          return null;
        }
      };
}