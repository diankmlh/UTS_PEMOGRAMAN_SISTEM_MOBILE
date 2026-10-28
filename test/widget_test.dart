import 'package:flutter_test/flutter_test.dart';
import 'package:uts_pemograman_sistem_mobile/main.dart';

void main() {
  testWidgets('Kantin Kita menampilkan daftar menu makanan manis', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KantinKitaApp());

    expect(find.text('Kantin Kita'), findsOneWidget);
    expect(find.text('Menu Favorit'), findsOneWidget);
    expect(find.text('Brownies Cokelat'), findsOneWidget);
    expect(find.text('Donat Strawberry'), findsOneWidget);
    expect(find.text('Cookies Choco Chip'), findsOneWidget);
    expect(find.text('Cheesecake Mini'), findsOneWidget);
  });
}
