import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/authentication/presentation/widgets/ElevatedBtns.dart';
import 'package:kaps/features/authentication/presentation/widgets/constants.dart';

void main() {
  group('ElevatedBtns', () {
    testWidgets('should render ElevatedButton with correct style', (WidgetTester tester) async {
      const PrimaryColor = Colors.blue;
      const SecondaryColor = Colors.red;
      const TextDisplay = 'Test Button';
      
      await tester.pumpWidget(MaterialApp(
        home: ElevatedBtns(
          PrimaryColor: PrimaryColor,
          SecondaryColor: SecondaryColor,
          TextDisplay: TextDisplay,
          Onpressed: (){},
        ),
      ));

      var elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);

      var buttonStyle = (tester.widget(elevatedButton) as ElevatedButton).style;
      expect(buttonStyle!.shape?.resolve({}) is RoundedRectangleBorder, isTrue);
      expect(buttonStyle.backgroundColor?.resolve({}), equals(PrimaryColor));
      expect(buttonStyle.shadowColor?.resolve({}), equals(SecondaryColor));
    });

    testWidgets('should call onPressed callback when tapped',
        (WidgetTester tester) async {
      const PrimaryColor = Colors.blue;
      const SecondaryColor = Colors.red;
      const TextDisplay = 'Test Button';

      bool onPressedCalled = false;
      final Onpressed = () => onPressedCalled = true;

      await tester.pumpWidget(MaterialApp(
        home: ElevatedBtns(
          PrimaryColor: PrimaryColor,
          SecondaryColor: SecondaryColor,
          TextDisplay: TextDisplay,
          Onpressed: Onpressed,
        ),
      ));

      expect(onPressedCalled, isFalse);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(onPressedCalled, isTrue);
    });

    testWidgets('should render child Text widget with correct style',
        (WidgetTester tester) async {
      const PrimaryColor = Colors.blue;
      const SecondaryColor = Colors.red;
      const TextDisplay = 'Test Button';

      await tester.pumpWidget(MaterialApp(
        home: ElevatedBtns(
          PrimaryColor: PrimaryColor,
          SecondaryColor: SecondaryColor,
          TextDisplay: TextDisplay,
          Onpressed: () {},
        ),
      ));

      var textWidget = find.byType(Text);
      expect(textWidget, findsOneWidget);
      expect((tester.widget(textWidget) as Text).style,
          equals(GoogleFonts.inter(fontSize: 18, color: AppColors["white"])));
    });
  });
}
