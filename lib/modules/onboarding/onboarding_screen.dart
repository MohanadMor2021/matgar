import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

List<BoardingModel> boarding = [
  BoardingModel(
      image: 'assets/images/firstborder.jpg',
      title: 'تطبيق المواشي',
      body: ' تطبيق بيع وشراء للمواشي  الأول في الوطن العربي'),
  BoardingModel(
      image: 'assets/images/firstborder.jpg',
      title: 'تطبيق المواشي',
      body:
          '  قم الآن بعرض الماشية الخاصة بك بطريقة منظمة للزبائن والوصول لزبائن أكثر والمنافسة في السوق '),
  BoardingModel(
      image: 'assets/images/firstborder.jpg',
      title: 'تطبيق المواشي',
      body:
          ' ميزات كثيرة يحتويها التطبيق للمهتمين في بيع المواشي وشرائها قم الآن بتسجيل حسابك الخاص وكلمة المرور لمرة واحدة '),
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SvgPicture.asset(
                'assets/images/splash.svg',
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black),
                          child: TextButton(
                              onPressed: submit,
                              child: const Text(
                                'تخطي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          onPageChanged: (int index) {
                            if (index == boarding.length - 1) {
                              setState(() {
                                isLast = true;
                              });
                            } else {
                              setState(() {
                                isLast = false;
                              });
                            }
                          },
                          controller: boardController,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildBoardingItem(boarding[index]);
                          },
                          itemCount: boarding.length,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SmoothPageIndicator(
                            controller: boardController,
                            count: boarding.length,
                            // ignore: prefer_const_constructors
                            effect: ExpandingDotsEffect(
                              dotColor: Colors.grey,
                              dotHeight: 10,
                              dotWidth: 10,
                              expansionFactor: 4,
                              spacing: 5,
                              activeDotColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      !isLast
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextButton(
                                    onPressed: () {
                                      boardController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 750),
                                          curve: Curves.fastLinearToSlowEaseIn);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'التالي',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Baseline(
                                              baseline: 33,
                                              baselineType:
                                                  TextBaseline.alphabetic,
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: 30,
                                              ))
                                        ],
                                      ),
                                    )),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextButton(
                                    onPressed: submit,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'البدأ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Baseline(
                                              baseline: 33,
                                              baselineType:
                                                  TextBaseline.alphabetic,
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: 30,
                                              ))
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(
            'assets/images/sheep.png',
            width: 280,
            height: 280,
          )),
          Center(
            child: Text(
              '${model.title}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '${model.body}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
    // CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    //   if (value) {

    //   }
    // });
  }
}
