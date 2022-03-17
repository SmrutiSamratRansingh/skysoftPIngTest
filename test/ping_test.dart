import 'package:dart_ping/dart_ping.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPing extends Mock implements Ping {}

void main() {
  final ping = Ping(
    'google.com',
    count: 5,
  );

  test('Test the Ping calls made to google', () {
    ping.stream.listen((event) {
      expect(event.response!.ip, '172.217.166.46');
    });
  });
}
