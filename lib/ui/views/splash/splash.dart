// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:recreate_with_czar_1/ui/style/colors.dart';
import 'package:recreate_with_czar_1/ui/style/text_style.dart';
import 'package:recreate_with_czar_1/ui/views/interests/choose_interest.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    next();
  }

  void next() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChooseInterest(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.black,
              AppColors.backgroundGradient2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 44.h,
              child: Image.asset(
                "assets/light.png",
              ),
            ),
            Positioned(
              top: 107.h,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/speak.png"),
                    Gap(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const StrokeText(
                              size: 40,
                              text: "Speak",
                              strokeColor: AppColors.secondary,
                            ),
                            Text(
                              "Sphere",
                              style: AppTextStyle.white40.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        const StrokeText(
                          size: 16,
                          text: "...speak the world",
                          strokeColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 193.h,
              child: Transform(
                transform: Matrix4.rotationY(0),
                child: Image.asset(
                  "assets/father.png",
                  height: 284.h,
                ),
              ),
            ),
            Positioned(
              bottom: 93.h,
              right: 0,
              child: Image.asset(
                "assets/mother.png",
                height: 275.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StrokeText extends StatelessWidget {
  final String text;
  final Color strokeColor;
  final double size;
  const StrokeText({
    super.key,
    required this.text,
    required this.strokeColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size.sp,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: size.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
