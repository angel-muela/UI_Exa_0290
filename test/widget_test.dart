import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Asegúrate de que 'myapp' sea el nombre de tu proyecto en pubspec.yaml

void main() {
  testWidgets('Carga inicial de sucursales', (WidgetTester tester) async {
    // 1. Cargamos la app
    await tester.pumpWidget(const MyApp());

    // 2. Verificamos que el título grande que pediste aparezca
    expect(find.text('SUCURSALES'), findsOneWidget);

    // 3. Verificamos que al menos una sucursal ficticia esté en pantalla
    expect(find.text('Sucursal Centro'), findsOneWidget);
  });
}