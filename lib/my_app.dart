part of 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///Routes
      initialRoute: AppRoutes.initial,
      routes: AppPages.routes,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
