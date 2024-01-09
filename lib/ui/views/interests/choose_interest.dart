import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:recreate_with_czar_1/ui/style/colors.dart';
import 'package:recreate_with_czar_1/ui/style/text_style.dart';

class ChooseInterest extends StatefulWidget {
  const ChooseInterest({super.key});

  @override
  State<ChooseInterest> createState() => _ChooseInterestState();
}

class _ChooseInterestState extends State<ChooseInterest> {
  List<String> allInterest = [
    "Studies",
    "Reading",
    "Technologies ",
    "Travel",
    "Psychology",
    "Gaming",
    "TV/Movies",
    "Sports",
    "Languages",
    "Fashion",
    "Fitness",
    "Pets",
    "Food",
    "Climate Change",
    "Self-care",
    "Work life",
    "Culture",
    "Design",
    "Sociology",
    "Outdoor",
    "Networking",
    "Romance",
    "Shopping",
    "Sight-seeing",
  ];
  List<String> selectedInterest = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                  ),
                  Gap(10.w),
                  Expanded(
                    child: LinearProgressBar(
                      currentStep: selectedInterest.length,
                      maxSteps: 6,
                      progressType: LinearProgressBar.progressTypeLinear,
                      progressColor: AppColors.primary,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Gap(10.w),
                  Text(
                    "${selectedInterest.length}/6",
                    style: AppTextStyle.black13Bold,
                  ),
                ],
              ),
              Gap(29.h),
              Text(
                "What interests you?",
                style: AppTextStyle.black20Bold,
              ),
              Gap(9.h),
              Text(
                "Select all that applies",
                style: AppTextStyle.grey13Bold,
              ),
              Gap(22.h),
              Wrap(
                children: [
                  ...allInterest.map(
                    (e) => AppChip(
                      text: e,
                      onPressed: () {
                        if (selectedInterest.contains(e)) {
                          setState(() {
                            selectedInterest.remove(e);
                          });
                        } else {
                          setState(() {
                            selectedInterest.add(e);
                          });
                        }
                      },
                      active: selectedInterest.contains(e),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppButton(
                text: "Continue",
                isDisabled: selectedInterest.length < 6,
                onPressed: () {},
              ),
              const Gap(10),
              AppButton.normal(
                text: "Skip for now",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isDisabled;
  final bool? normal;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled,
    this.normal,
  });
  const AppButton.normal({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled,
    this.normal = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isDisabled == true ? null : onPressed,
      color: normal == true ? AppColors.background : AppColors.primary,
      minWidth: 350.w,
      height: 56.h,
      elevation: normal == true ? 0 : 3,
      highlightElevation: normal == true ? 0 : 3,
      focusElevation: normal == true ? 0 : 3,
      hoverElevation: normal == true ? 0 : 3,
      disabledColor: AppColors.primary.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Text(
        text,
        style: AppTextStyle.black20
            .copyWith(color: normal == true ? AppColors.primary : Colors.white),
      ),
    );
  }
}

class AppChip extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool active;
  const AppChip({
    super.key,
    required this.text,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: DottedBorder(
        radius: const Radius.circular(18),
        borderType: BorderType.RRect,
        color: active ? AppColors.primary : AppColors.secondary,
        padding: EdgeInsets.zero,
        strokeWidth: 2,
        dashPattern: active ? [6, 0] : const [4, 3],
        child: MaterialButton(
          onPressed: onPressed,
          elevation: 0,
          color: active ? AppColors.secondary : AppColors.background,
          minWidth: 73.w,
          highlightElevation: 0,
          hoverElevation: 0,
          disabledColor: AppColors.primary.withOpacity(0.4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              text,
              style: AppTextStyle.black14
                  .copyWith(color: active ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
