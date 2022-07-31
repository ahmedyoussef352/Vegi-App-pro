import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuyuyuy/sreens/Home/splashscreen.dart';

import '../../providers/user_providers.dart';
import '../Home/Home.dart';
import '../Widget/app_scaffold.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;
   Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final dynamic user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider.addUserData(
          currentUser: user,
          userEmail: user.email,
          userImage: user.photoURL,
          userName: user.displayName);

      return user;
    } catch (e) {
      print(e);
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////apple

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Vegi',
              style: TextStyle(color: Colors.white, fontSize: 60, shadows: [
                BoxShadow(
                  color: Colors.green.shade700,
                  offset: Offset(3, 3),
                  blurRadius: 3,
                )
              ]),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 260,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: InkWell(
                  splashColor: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/R.png'),
                        width: 25,
                      ),
                      Text(
                        'Sign in with Apple',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () async {
                    await signInWithApple().then(
                      (value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AppScaffold(child: Splash()),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              width: 260,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: InkWell(
                  splashColor: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/Google__G__Logo.svg.png'),
                        width: 25,
                      ),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () async {
                    await _googleSignUp().then(
                      (value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AppScaffold(child: Splash()),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'By signing in you are agreeing to our',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Terms and Privacy Policy',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
