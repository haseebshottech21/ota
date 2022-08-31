import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/widgets/common/animation.dart';
import 'package:ota/widgets/common/backgound.dart';
import 'package:ota/widgets/common/fade_in_widget.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:ota/constants.dart' as constant;

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgoundImage(imagePath: constant.backgroundImage),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyAnimation(
                      imgHeight: MediaQuery.of(context).size.height * 0.45,
                      imgUrl: constant.earthCircleImage,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 70,
                  bottom: 20,
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInDown(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(constant.logoImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const MyFadeIn(
                      child: Text(
                        constant.introTitle,
                        style: TextStyle(
                          // color: Color.fromRGBO(211, 78, 129, 1),
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: '',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyFadeIn(
                      child: Text(
                        constant.introDescription,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Spacer(),
                    Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> _key = GlobalKey();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideAction(
                            // elevation: 5,
                            sliderRotate: false,
                            outerColor: const Color(0xFFa45ca4),
                            innerColor: const Color(0xFF834a83),
                            // Pink Shade
                            // outerColor: const Color(0xFFbc5590),
                            // innerColor: const Color(0xFF964473),
                            // Purple Shade
                            // outerColor: const Color(0xFF8366ac),
                            // innerColor: const Color(0xFF69528a),
                            submittedIcon: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            child: FadeInRight(
                                child: const Text(
                              'Swipe to get started',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )),
                            key: _key,
                            sliderButtonIcon: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                            onSubmit: () {
                              Future.delayed(
                                const Duration(seconds: 1),
                                () {
                                  Navigator.pushNamed(context, RouteName.login);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
