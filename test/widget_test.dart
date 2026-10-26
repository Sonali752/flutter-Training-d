import 'package:flutter_test/flutter_test.dart';
import 'package:simple_banking_app/main.dart';

void main() {
  testWidgets('deposit and withdrawal update the balance', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('\$1250.00'), findsOneWidget);

    await tester.tap(find.text('Deposit \$50'));
    await tester.pump();
    expect(find.text('\$1300.00'), findsOneWidget);

    await tester.tap(find.text('Withdraw \$50'));
    await tester.pump();
    expect(find.text('\$1250.00'), findsOneWidget);
  });
}
