import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class ProgressPercentage extends StatefulWidget {
//   const ProgressPercentage({Key? key}) : super(key: key);

//   @override
//   State<ProgressPercentage> createState() => _ProgressPercentageState();
// }

// class _ProgressPercentageState extends State<ProgressPercentage> {
//   double mywidth = 0.0;
//   double totalpercent = 50.0;
//   bool animation = false;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//       const Duration(milliseconds: 500),
//     ).then((value) {
//       setState(() {
//         animation = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final totalWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         Container(
//           height: 20,
//           width: totalWidth,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(50),
//           ),
//         ),
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 700),
//           height: 20,
//           width: animation ? totalWidth * (totalpercent / 130) : mywidth,
//           decoration: BoxDecoration(
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(50),
//           ),
//         ),
//         Positioned(
//           top: 0,
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Center(
//             child: Text(
//               '${double.parse(totalpercent.toString())} %',
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ProgressBar extends StatelessWidget {
//   final double max;
//   final double current;
//   final Color color;

//   const ProgressBar({
//     Key? key,
//     required this.max,
//     required this.current,
//     this.color = Colors.green,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, boxConstraints) {
//         var x = boxConstraints.maxWidth;
//         var percent = (current / max) * x;
//         return Stack(
//           children: [
//             Container(
//               width: x,
//               height: 7,
//               decoration: BoxDecoration(
//                 color: Color(0xffd3d3d3),
//                 borderRadius: BorderRadius.circular(35),
//               ),
//             ),
//             AnimatedContainer(
//               duration: Duration(milliseconds: 500),
//               width: percent,
//               height: 7,
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(35),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class CircularProgressPercent extends StatefulWidget {
  final double totalpercent;
  const CircularProgressPercent({
    required this.totalpercent,
    Key? key,
  }) : super(key: key);

  @override
  State<CircularProgressPercent> createState() =>
      _CircularProgressPercentState();
}

class _CircularProgressPercentState extends State<CircularProgressPercent> {
  // double myProgress = 0.0;
  bool animation = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    Future.delayed(
      const Duration(milliseconds: 200),
    ).then((value) {
      setState(() {
        animation = true;
      });
    });
  }

  Timer? _timer;
  // int _start = 10;
  int myProgress = 0;

  void startTimer() {
    var convertInt = widget.totalpercent;
    final int convert = (convertInt /
            (convertInt < 30
                ? 20
                : convertInt < 50
                    ? 40
                    : convertInt < 70
                        ? 50
                        : convertInt < 90
                            ? 90
                            : 100))
        .round();

    final oneSec = Duration(microseconds: 20000 * convert);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (myProgress == widget.totalpercent) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            myProgress++;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, _) {
            return SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                value: animation ? value / (100 / widget.totalpercent) : 0.0,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
              ),
            );
          },
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              '$myProgress %',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LinearProgressPercent extends StatefulWidget {
  final double totalpercent;

  const LinearProgressPercent({
    required this.totalpercent,
    Key? key,
  }) : super(key: key);

  @override
  State<LinearProgressPercent> createState() => _LinearProgressPercentState();
}

class _LinearProgressPercentState extends State<LinearProgressPercent> {
  double myProgress = 0.0;
  bool animation = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 200),
    ).then((value) {
      setState(() {
        animation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1),
          duration: const Duration(milliseconds: 1500),
          builder: (context, value, _) {
            return SizedBox(
              height: 18,
              width: MediaQuery.of(context).size.width,
              // alignment: Alignment.topCenter,
              // margin: const EdgeInsets.only(top: 20),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(const Radius.circular(20.0)),
              // ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: animation
                      ? value / (100 / widget.totalpercent)
                      : myProgress,
                  backgroundColor: theme.backgroundColor,
                  color: Colors.green,
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              '${double.parse(widget.totalpercent.toString()).toInt()} %',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: widget.totalpercent > 50 ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
