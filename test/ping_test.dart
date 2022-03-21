import 'package:dart_ping/dart_ping.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPing extends Mock implements Ping {}

void main() {
  var ping;
  setUp(() {
    ping = Ping(
      'google.com',
      count: 5,
    );
  });

  test('Test the Ping calls made to google', () {
    int i = 0;
    ping.stream.listen((event) {
      if (i < 6) {
        i++;
      }
      expect(event, isNotNull);
      expect(event.response!.ip, '172.217.166.46');
      expect(event.response!.time, isNot(null));

      if (event == null) {
        expect(i, 5);
        print(i);
      }
    });
  });
}
