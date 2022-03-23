import 'package:autorun/Views/Authentification.dart';
import 'package:flutter_test/flutter_test.dart';

/*void main() {
  test('empty email returns error string', () {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });

  test('non-empty email returns null', () {
    final result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('empty password returns error string', () {
    final result = PasswordFieldValidator.validate('');
    expect(result, 'Email can't be empty or invalid');
  });

  test('non-empty password returns null', () {
    final result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}*/

void main() {
  test('title', () {});
  test('Empty or invalid email returns String error', () {
    var result = EmailFieldValidator.validate('Lamis@esi.com');
    expect(result, null);
  });
  test('title', () {});
  test('Empty or invalid email returns String error', () {
    var result = EmailFieldValidator.validate('test');
    expect(result, 'Email can\'t be empty or invalid');
  });
  test('title', () {});
  test('Empty or invalid email returns String error', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty or invalid');
  });
  /* Test  Faiure 
  test('title', () {});
  test('Empty or invalid email returns String error', () {
    var result = EmailFieldValidator.validate('');
    expect(result, null);
  });
  */

  test('empty password returns error string', () {
    final result = PasswordFieldValidator.validate('');
    expect(result, 'Password can\'t be empty or invalid');
  });
  test('empty password returns error string', () {
    final result = PasswordFieldValidator.validate('test');
    expect(result, 'Password can\'t be empty or invalid');
  });
  /*  Test Failure
  test('empty password returns error string', () {
    final result = PasswordFieldValidator.validate('test');
    expect(result, null);
  });*/

  test('Empty or invalid password returns String error', () {
    var resu = PasswordFieldValidator.validate('Lam9');
    expect(resu, "Password can't be empty or invalid");
  });
}
