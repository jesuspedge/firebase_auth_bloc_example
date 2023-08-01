import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_bloc_login_example/app/app_exports.dart';

class FakeBloc extends Fake implements Bloc<Object, Object> {}

class FakeCubit extends Fake implements Cubit<Object> {}

class FakeEvent extends Fake implements Object {}

class FakeState extends Fake implements Object {}

class FakeStackTrace extends Fake implements StackTrace {}

class FakeChange extends Fake implements Change<Object> {}

class FakeTransition extends Fake implements Transition<Object, Object> {}

final logs = <String>[];

void Function() overridePrint(void Function() testFn) {
  return () {
    final spec = ZoneSpecification(
      print: (_, __, ___, String msg) => logs.add(msg),
    );
    return Zone.current.fork(specification: spec).run<void>(testFn);
  };
}

void main() {
  group('AppBlocObserver', () {
    setUp(logs.clear);

    test('onEvent prints event', () {
      overridePrint(() {
        final bloc = FakeBloc();
        final event = FakeEvent();

        const AppBlocObserver().onEvent(bloc, event);
        expect(logs, equals(['$event']));
      });
    });

    test('onError prints error', () {
      overridePrint(() {
        final bloc = FakeBloc();
        final error = Object();
        final stackTrace = FakeStackTrace();

        const AppBlocObserver().onError(bloc, error, stackTrace);
        expect(logs, equals(['$error']));
      });
    });

    test('onChange prints change', () {
      overridePrint(() {
        final cubit = FakeCubit();
        final change = FakeChange();

        const AppBlocObserver().onChange(cubit, change);
        expect(logs, equals(['$change']));
      });
    });

    test('onTransition prints Transition', () {
      overridePrint(() {
        final bloc = FakeBloc();
        final transition = FakeTransition();

        const AppBlocObserver().onTransition(bloc, transition);
        expect(logs, ['$transition']);
      });
    });
  });
}
