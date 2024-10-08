import 'dart:ui';
import 'screens/home.dart';
import 'package:provider/provider.dart';
import 'helpers/constants.dart';
import 'helpers/notifier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Notifier(), child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTFatLife03',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: AppColor.back,
        dialogBackgroundColor: AppColor.back,
        focusColor: AppColor.primary,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            titleSmall: TextStyle(color: Colors.black54)
          ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.primary,
          onPrimary: Colors.white,
          secondary: AppColor.secondary,
          onSecondary: AppColor.white100,
          primaryContainer: AppColor.container,
          surface: AppColor.back,
          onSurface: AppColor.secondary,
          outline: AppColor.primary,
            error: Colors.pink
        ),
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget{
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Stack(fit: StackFit.expand, children: [
    ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),child: Image.asset("assets/image_back.jpeg", fit: BoxFit.cover,),),
    Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(margin: const EdgeInsets.all(40),
          constraints: const BoxConstraints(maxWidth: 450),
          child: Image.asset("assets/coil_image.jpeg", fit: BoxFit.scaleDown,)
      ),
      ElevatedButton(onPressed: ()=> Navigator.of(context).push(
          MaterialPageRoute(builder: (c) => const HomePage())
      ),
        style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(Spacing.x4)), minimumSize: const Size(250, 55)),
        child: const Text("Open Estimator", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),)
    ]))
  ]));

}