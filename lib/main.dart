import 'package:arena_sports_app/Repos.dart';
import 'package:arena_sports_app/screens/userDashboard/NavigationFiles.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:arena_sports_app/theme/DarkThemeProvider.dart';
import 'package:arena_sports_app/theme/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    getCurrentAppTheme();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
      return MaterialApp(
        theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        debugShowCheckedModeBanner: false,
        home: NavigationScreens(),
      );
    }));
  }
}

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example app: Sign in with Apple'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: SignInWithAppleButton(
              onPressed: () async {
                final credential = await SignInWithApple.getAppleIDCredential(
                  scopes: [
                    AppleIDAuthorizationScopes.email,
                    AppleIDAuthorizationScopes.fullName,
                  ],
                  webAuthenticationOptions: WebAuthenticationOptions(
                    // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
                    clientId:
                    'com.softuvo.arenasports',
                    redirectUri: Uri.parse(
                      'https://www.softuvo.com',
                    ),
                  ),
                  // TODO: Remove these if you have no need for them
                  nonce: 'example-nonce',
                  state: 'example-state',
                );

                print(credential);

                // This is the endpoint that will convert an authorization code obtained
                // via Sign in with Apple into a session in your system
                final signInWithAppleEndpoint = Uri(
                  scheme: 'https',
                  host: 'www.softuvo.com',
                  path: '',
                  queryParameters: <String, String>{
                    'code': credential.authorizationCode,
                    'firstName': credential.givenName,
                    'lastName': credential.familyName,
                    'useBundleId':
                    Platform.isIOS || Platform.isMacOS ? 'true' : 'false',
                    if (credential.state != null) 'state': credential.state,
                  },
                );

                final session = await http.Client().post(
                  signInWithAppleEndpoint,
                );

                // If we got this far, a session based on the Apple ID credential has been created in your system,
                // and you can now set this as the app's session
                print(session);
              },
            ),
          ),
        ),
      ),
    );
  }
}
*/
