import 'package:flutter_test/flutter_test.dart';
import 'package:aether_wallet/main.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AetherWalletApp());

    // Verify the app renders
    expect(find.byType(AetherWalletApp), findsOneWidget);
  });
}
