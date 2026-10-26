import 'package:flutter_test/flutter_test.dart';
import 'package:uts_pemograman_sistem_mobile/main.dart';

void main() {
  testWidgets('Bloom & Petal menampilkan daftar bunga', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BloomPetalApp());

    expect(find.text('Bloom & Petal'), findsOneWidget);
    expect(find.text('Sweet Rose Bouquet'), findsOneWidget);
    expect(find.text('Tulip Pastel'), findsOneWidget);
    expect(find.text('Sunflower Bliss'), findsOneWidget);
  });
}
