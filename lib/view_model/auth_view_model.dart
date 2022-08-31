import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ota/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repo/auth_repository.dart';
import '../utils/routes/custom_page_router.dart';
import '../pages/home/home_screen.dart';
import '../utils/routes/routes_name.dart';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();

  bool isRemember = false;
  checkRemeber() {
    isRemember = !isRemember;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }

  // bool _signupLoading = false;
  // bool get signupLoading => _signupLoading;

  // signUpLoading(bool value) {
  //   _signupLoading = value;
  //   notifyListeners();
  // }

  Future<void> login(BuildContext context) async {
    setLoad(true);
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value) {
        setLoad(false);
        Navigator.pushNamed(context, RouteName.home);
        // Navigator.of(context).push(
        //   CustomPageRouter(
        //     child: const MyHome(),
        //     direction: AxisDirection.left,
        //   ),
        // );
      },
    );
  }

  Future<void> loginApi(
    dynamic data,
    Function clearFields,
    BuildContext context,
  ) async {
    setLoad(true);
    _myRepo.loginApi(data).then((value) {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          setLoad(false);
          // Navigator.pushNamed(context, RouteName.home);

          // clearFields();
          // Navigator.of(context).push(
          //   CustomPageRouter(
          //     child: const MyHome(),
          //     direction: AxisDirection.left,
          //   ),
          // );

          // Utils.successFlushBarMessage(
          //   value.toString(),
          //   context,
          // );
          if (kDebugMode) {
            print(value.toString());

            clearFields();
            Navigator.of(context).push(
              CustomPageRouter(
                child: const MyHome(),
                direction: AxisDirection.left,
              ),
            );
            Utils.loadingFlushBarMessage(
              'Logging Successfully!',
              context,
              color: Colors.green,
            );
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   RouteName.home,
            //   (route) => false,
            // );
          }
        },
      );
    }).onError((error, stackTrace) {
      setLoad(false);
      Utils.errorFlushBarMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> logoutApi(
    BuildContext context,
  ) async {
    setLoad(true);
    // _myRepo.logoutApi().then((value) {
    Utils.loadingFlushBarMessage(
      'Loggin out...',
      context,
    );
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        setLoad(false);

        // Utils.successFlushBarMessage(
        //   value.toString(),
        //   context,
        // );
        userSignOut();
        Navigator.pushNamed(context, RouteName.login);
        Utils.loadingFlushBarMessage(
          'Logged Out.',
          context,
        );
        // if (kDebugMode) {
        //   print(value.toString());
        //   Navigator.of(context).push(
        //     CustomPageRouter(
        //       child: const MyHome(),
        //       direction: AxisDirection.left,
        //     ),
        //   );
        // }
      },
    );
    // }).onError((error, stackTrace) {
    //   setLoad(false);
    //   Utils.errorFlushBarMessage(error.toString(), context);
    //   if (kDebugMode) {
    //     print(error.toString());
    //   }
    // });
  }

  bool _singInUser = false;
  bool get singInUser => _singInUser;

  // instance of firebaseauth, facebook and google
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // hasError, errorCode, provider, uid, eamil, name, imageUrl
  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  AuthViewModel() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    _singInUser = s.getBool('signed_in') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool('signed_in', true);
    _singInUser = true;
    notifyListeners();
  }

  // sign in with google
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // executing our authentication
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // signing to firebase user instance
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;

        // now save all values
        _name = userDetails.displayName;
        _email = userDetails.email;
        _imageUrl = userDetails.photoURL;
        _provider = "GOOGLE";
        _uid = userDetails.uid;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
                "You already have an account with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;
          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  // sign in with faceebook
  Future signInWithFacebook() async {
    // by default we request the email and the public profile
    final LoginResult result = await facebookAuth.login();

    final graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken!.token}'));

    final profile = jsonDecode(graphResponse.body);

    // or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final accessToken = result.accessToken!.token;

      try {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken);
        await firebaseAuth.signInWithCredential(credential);

        // saving the values
        _uid = profile['id'];
        _name = profile['name'];
        _email = profile['email'];
        _imageUrl = profile['picture']['data']['url'];
        _hasError = false;
        _provider = "FACEBOOK";
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
                "You already have an account with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;
          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      print(result.status);
      print(result.message);

      _hasError = true;
      notifyListeners();
    }
  }

  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _name = snapshot['name'],
              _email = snapshot['email'],
              _imageUrl = snapshot['imageUrl'],
              _provider = snapshot['provider'],
            });
  }

  Future saveDataToFirestore() async {
    final DocumentReference reference =
        FirebaseFirestore.instance.collection('users').doc(uid);

    await reference.set({
      "name": _name,
      "email": _email,
      "uid": _uid,
      "imageUrl": _imageUrl,
      "provider": _provider,
    });
    notifyListeners();
  }

  Future saveDataToSharedPrefrence() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('uid', _uid!);
    await s.setString('imageUrl', _imageUrl!);
    await s.setString('provider', _provider!);
    notifyListeners();
  }

  Future getDataFromSharedPrefrence() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _name = s.getString('name');
    _email = s.getString('email');
    _uid = s.getString('uid');
    _imageUrl = s.getString('imageUrl');
    _provider = s.getString('provider');
    notifyListeners();
  }

  // check user exist or not in cloudfirestore
  Future<bool> checkUserExist() async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (snap.exists) {
      print('EXISTING USER');
      return true;
    } else {
      print('NEW USER');
      return false;
    }
  }

  // signout
  Future userSignOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
    await facebookAuth.logOut();

    _singInUser = false;
    notifyListeners();
    // clear all storage information
    clearStoredData();
  }

  Future clearStoredData() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
  }
}
