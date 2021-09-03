class Images {
  static const profile1 =
      'https://res.cloudinary.com/convre/image/upload/v1628367052/User_Profile_Avatars/qirffwjmozpwpfzf7bav.jpg';
  static const profile2 =
      'https://res.cloudinary.com/convre/image/upload/v1621084557/User_Profile_Avatars/i8lsjr4poxta7r0wrfto.jpg';
  static const context1 =
      'https://convre-image-posts-bucket.s3.eu-central-1.amazonaws.com/43855D7B-E5BD-4815-9E02-3F57D9D8D513.jpeg';
  static const context2 =
      'https://convre-image-posts-bucket.s3.eu-central-1.amazonaws.com/BB35AF96-12AB-416E-BF7A-2934281C210C.png';
}

const String SERVER_DOWN = 'Server Down!';
const String PARSING_ERROR = 'Parsing Error, Try again';
const String DEVELOPER_ERROR = 'Developer Error';
const String SUCCESSFUL = 'Operation Successful';
const String UNKNOWN_USER = 'This user does not exist';
const String LOGGED_OUT_USER = 'Logged out';
const String LOGGED_IN_USER = 'Logged in';
const String EMPTY_FIELD = 'Field Cannot be empty';
const String INCOMPLETE_PASSWORD = 'Password must be more than 8 characters';
const String PASSWORD_CRITERIA_FAILED = 'Password needs to have a number';
const String PASSWORD_DOES_NOT_MATCH = 'Passwords do not match';
const String NEEDS_PASSWORD_CHANGE = 'needs_pwd_change';
const String CREDENTIALS_ARE_WRONG =
    'These credentials are wrong \nCheck and try again';
const int SERVER_OKAY = 200;
const int CREATED = 201;
const int SERVER_MAINTENANCE = 500;
const int POORLY_FORMATTED_REQUEST = 400;
const int WRONG_CREDENTIALS = 401;
const int RESOURCE_NOT_FOUND = 404;
const int REQUEST_CANNOT_BE_PROCESSED = 422;
const int ACCOUNT_ALREADY_EXISTS = 409;
const int REDIRECT = 307;
