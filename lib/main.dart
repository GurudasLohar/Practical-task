
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibicle_practical/providers/login_provider.dart';
import 'package:tibicle_practical/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Practical Task',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: SplashScreen(),
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
    );
  }
}
