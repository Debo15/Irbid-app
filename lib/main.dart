import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irbid/Controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:irbid/languageChangeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainPage());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Future.delayed(const Duration(
        seconds: 2), () { // smooth, not talking more than 2 seconds
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Controller()));
    });
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green.shade100, Colors.green.shade400]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:ShaderMask(
                    shaderCallback: (bounds) {
                      return  LinearGradient(
                        colors: [Colors.green.shade600, Colors.green.shade900],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: const Text(
                      "Welcome to Irbid",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  )
                  ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Image.asset("assets/splash_logo.png")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                    child: ShaderMask(
                        shaderCallback: (bounds) {
                          return  LinearGradient(
                            colors: [Colors.green, Colors.brown.shade700],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset("assets/loading.gif")
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.green,
            fontFamily: "NotoSans",
          ),
          home: MyApp(),
        ),
      ),
    );
  }
}
