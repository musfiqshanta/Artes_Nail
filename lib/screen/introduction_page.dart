import 'package:artas_nails/firebase/firebase.dart';
import 'package:artas_nails/screen/mydesign/my_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/custom_button.dart';
import '../controller/onBoarding_controller.dart';
import '../utils/dimention.dart';
import 'Login/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final OnBoardingController onBoardingController =
        Get.put(OnBoardingController());
    onBoardingController.getOnBoardingList();
    final firebasecontroller = Get.put(FirebaseController());
    return Scaffold(
      body: GetBuilder<OnBoardingController>(
        builder: (onBoardingController) => onBoardingController
                    .onBoardingList.length >
                0
            ? SafeArea(
                child: Center(
                    child: SizedBox(
                        width: Dimensions.WEB_MAX_WIDTH,
                        child: Column(children: [
                          Expanded(
                              child: PageView.builder(
                            itemCount:
                                onBoardingController.onBoardingList.length,
                            controller: _pageController,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        onBoardingController
                                            .onBoardingList[index].imageUrl,
                                        height: context.height * 0.7),
                                  ]);
                            },
                            onPageChanged: (index) {
                              onBoardingController.changeSelectIndex(index);
                            },
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                _pageIndicators(onBoardingController, context),
                          ),
                          SizedBox(height: context.height * 0.05),
                          Padding(
                            padding:
                                EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                            child: Row(children: [
                              onBoardingController.selectedIndex == 3
                                  ? SizedBox()
                                  : Expanded(
                                      child: CustomButton(
                                        transparent: true,
                                        onPressed: () {
                                          firebasecontroller.isUserLoggedin()
                                              ? Get.to(MyDesignScreen())
                                              : Get.to(LoginPage());
                                        },
                                        buttonText: 'Skip'.tr,
                                      ),
                                    ),
                              Expanded(
                                child: CustomButton(
                                  buttonText:
                                      onBoardingController.selectedIndex != 3
                                          ? 'Next'.tr
                                          : 'Get Started'.tr,
                                  onPressed: () {
                                    if (onBoardingController.selectedIndex !=
                                        3) {
                                      _pageController.nextPage(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.ease);
                                      print("1");
                                    } else if (onBoardingController
                                            .selectedIndex ==
                                        3) {
                                      firebasecontroller.isUserLoggedin()
                                          ? Get.to(MyDesignScreen())
                                          : Get.to(LoginPage());
                                      print("1");

                                      // Get.find<SplashController>().disableIntro();
                                      // Get.offNamed(RouteHelper.getSignInRoute(RouteHelper.onBoarding));
                                    } else {
                                      onBoardingController.changeSelectIndex(
                                          onBoardingController.selectedIndex);
                                    }
                                  },
                                ),
                              ),
                            ]),
                          ),
                        ]))),
              )
            : SizedBox(),
      ),
    );
  }

  List<Widget> _pageIndicators(
      OnBoardingController onBoardingController, BuildContext context) {
    List<Container> _indicators = [];

    for (int i = 0; i < onBoardingController.onBoardingList.length; i++) {
      _indicators.add(
        Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: i == onBoardingController.selectedIndex
                ? Colors.pink
                : Theme.of(context).disabledColor,
            borderRadius: i == onBoardingController.selectedIndex
                ? BorderRadius.circular(50)
                : BorderRadius.circular(25),
          ),
        ),
      );
    }
    return _indicators;
  }
}
