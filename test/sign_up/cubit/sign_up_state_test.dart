import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

import 'package:firebase_bloc_login_example/sign_up/sign_up_exports.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  const email = Email.dirty('email');
  const passwordString = 'password';
  const password = Password.dirty(passwordString);
  const confirmedPassword =
      ConfirmedPassword.dirty(password: passwordString, value: passwordString);

  group('SignUpState', () {
    test('supports value comparisons', () {
      expect(const SignUpState(), const SignUpState());
    });

    test('returns same object when no preperties are passed', () {
      expect(const SignUpState().copyWith(), const SignUpState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
          const SignUpState().copyWith(status: FormzSubmissionStatus.initial),
          const SignUpState());
    });

    test('returns object with updated email when email is passed', () {
      expect(const SignUpState().copyWith(email: email),
          const SignUpState(email: email));
    });

    test('retuns object with updated password when password is passed', () {
      expect(const SignUpState().copyWith(password: password),
          const SignUpState(password: password));
    });

    test(
        'returns object with updated confirmedPassdword'
        ' when ConfirmedPassword is passed', () {
      expect(const SignUpState().copyWith(confirmedPassword: confirmedPassword),
          const SignUpState(confirmedPassword: confirmedPassword));
    });
  });
}
