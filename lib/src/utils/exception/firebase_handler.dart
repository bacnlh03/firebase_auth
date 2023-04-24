enum FirebaseExceptionCode {
  invalidEmail,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  weakPassword,
  userDisabled,
  tooManyRequests,
  operationNotAllowed,
  undefined,
}

class FirebaseHandler {
  FirebaseHandler._();

  static FirebaseExceptionCode handleException(e) {
    FirebaseExceptionCode exceptionCode;

    switch (e.code) {
      case 'invalid-email':
        exceptionCode = FirebaseExceptionCode.invalidEmail;
        break;

      case 'user-not-found':
        exceptionCode = FirebaseExceptionCode.userNotFound;
        break;

      case 'wrong-password':
        exceptionCode = FirebaseExceptionCode.wrongPassword;
        break;

      case 'email-already-in-use':
        exceptionCode = FirebaseExceptionCode.emailAlreadyInUse;
        break;

      case 'weak-password':
        exceptionCode = FirebaseExceptionCode.weakPassword;
        break;

      case 'user-disabled':
        exceptionCode = FirebaseExceptionCode.userDisabled;
        break;

      case 'too-many-requests':
        exceptionCode = FirebaseExceptionCode.tooManyRequests;
        break;

      case 'operation-not-allowed':
        exceptionCode = FirebaseExceptionCode.operationNotAllowed;
        break;

      default:
        exceptionCode = FirebaseExceptionCode.undefined;
        break;
    }

    return exceptionCode;
  }

  static String exceptionMessage(FirebaseExceptionCode exceptionCode) {
    String exceptionMsg;

    switch (exceptionCode) {
      case FirebaseExceptionCode.invalidEmail:
        exceptionMsg = 'Invalid email';
        break;

      case FirebaseExceptionCode.userNotFound:
        exceptionMsg = 'User not found';
        break;

      case FirebaseExceptionCode.wrongPassword:
        exceptionMsg = 'Wrong password';
        break;

      case FirebaseExceptionCode.emailAlreadyInUse:
        exceptionMsg = 'Email already in use';
        break;

      case FirebaseExceptionCode.weakPassword:
        exceptionMsg = 'Password should be at least 6 characters';
        break;

      case FirebaseExceptionCode.userDisabled:
        exceptionMsg = 'User disabled';
        break;

      case FirebaseExceptionCode.tooManyRequests:
        exceptionMsg = 'Too many requests';
        break;

      case FirebaseExceptionCode.operationNotAllowed:
        exceptionMsg = 'Operation not allowed';
        break;

      case FirebaseExceptionCode.undefined:
        exceptionMsg = 'Something went wrong';
        break;
    }

    return exceptionMsg;
  }
}
