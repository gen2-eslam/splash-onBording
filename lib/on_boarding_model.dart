class OnBoardingModel {
  String imagePath;
  String title;
  String description;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        imagePath: "assets/images/Object.png",
        title: "Behavioral Health Service",
        description:
            "Transforming lives by offering hope and opportunities for recovery, wellness, and independence."),
    OnBoardingModel(
        imagePath: "assets/images/Object2.png",
        title: "Mental Health Service",
        description:
            "If you think that you or someone you know has a mental health problem, there are a number of ways that you can seek advice."),
    OnBoardingModel(
        imagePath: "assets/images/Object3.png",
        title: "Get Started",
        description:
            "Take the first step on your journey to better mental health. Get started today!")
  ];
}
