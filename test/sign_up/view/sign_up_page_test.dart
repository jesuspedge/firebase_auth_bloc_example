import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:authentication_repository/authentication_repository_exports.dart';
import 'package:firebase_bloc_login_example/sign_up/sign_up_exports.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('SignUpPage', () {
    test('has route', () {
      expect(SignUpPage.route(), isA<MaterialPageRoute<void>>());
    });

    testWidgets('renders a SignUpForm', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => MockAuthenticationRepository(),
          child: const MaterialApp(
            home: SignUpPage(),
          ),
        ),
      );
      expect(find.byType(SignUpForm), findsOneWidget);
    });
  });
}
