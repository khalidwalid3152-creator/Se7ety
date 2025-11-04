import 'package:se7ety/core/images/images.dart';

class OnboardingModel {
  String? image;
  String? title;
  String? description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}


List<OnboardingModel> onboaeding=[
  OnboardingModel(image: AppImages.standdoctors, title: "ابحث عن دكتور متخصص", description: "اكتشف مجموعه واسعه من الاطباء الخبراء و المتخصصين في مختلف المجالات الطبيه"),
  OnboardingModel(image: AppImages.on3, title: " سهولة الحجز  ", description:" احجز مواعيدك في اي وقت و من اي مكان "),
  OnboardingModel(image: AppImages.on2, title: "أمن و سري ", description: "كن مطمئننا فبياناتك الطبيه و شخصيتك في امان تام معنا ")
];
