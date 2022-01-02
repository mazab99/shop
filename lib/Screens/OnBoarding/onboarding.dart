import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/Screens/LogIn/login_screen.dart';
import 'package:shop/Screens/Register/register_screen.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardingModel {
  final String title;
  final String body1;
  final String body2;
  final String body3;
  final String image;

  BoardingModel({
    required this.title,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.image,
  });
}

var boardController = PageController();

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLast = false;
  int pageIndex = 0;

  void submit()
  {
    CashHelper.saveData(key: 'onBoarding', value: true,).then((value)
    {
      if(value) navigateandFinish(context, LoginScreen());
    });


  }

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
        title: 'Best Learning Exp.',
        body1: 'No more frequent flaws, no boundaries \n',
        body2: 'between the teacher and his students.',
        body3: '',
        image: 'image/onboarding1.svg',
      ),
      BoardingModel(
        title: 'Perfect community',
        body1: '“You will never walk alone” is what we worked \n',
        body2: 'for in order to reduce the gap between \n',
        body3: '  student and the teacher.',
        image: 'image/onboarding2.svg',
      ),
      BoardingModel(
        title: 'Join Now',
        body1: 'No matter how complex your course content \n ',
        body2: 'is , Smart-edu is smart enough to keep \n students ',
        body3: 'focused on what they have to do.',
        image: 'image/onboarding3.svg',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: (){
           // ShopBloc.get(context).changeAppMode();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
        ),
        child: Column(
          children: [
            //PageView buildBoarding
            Container(
              height: MediaQuery.of(context).size.height * .5,
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      pageIndex = index;
                      isLast = false;
                    });
                  } else {
                    setState(() {
                      pageIndex = index;
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              children: [
                if (pageIndex == 0)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('E3F2FD')),
                    ),
                    onPressed: () {
                      if (!isLast || isLast) {
                        boardController.previousPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                if (pageIndex != 0)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('0053CB')),
                    ),
                    onPressed: () {
                      if (!isLast || isLast) {
                        boardController.previousPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                Spacer(),
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: HexColor('E3F2FD'),
                    activeDotColor: HexColor('0053CB'),
                    dotHeight: 14,
                    dotWidth: 14,
                    spacing: 8,
                    expansionFactor: 3,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                if (pageIndex == 1 || pageIndex == 0)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('0053CB')),
                    ),
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                if (pageIndex == 2)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(HexColor('E3F2FD')),
                    ),
                    onPressed: () {
                      if (isLast) {
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            if (pageIndex != 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Row(
                        children: [
                          Text(
                            'Skip',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: HexColor('90CAF9'),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(HexColor('90CAF9')),
                      ),
                      onPressed: () {
                        submit();
                      },
                    ),
                  ],
                ),
              ),
            if (pageIndex == 2)
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(
                    MediaQuery.of(context).size.width * .925,
                    MediaQuery.of(context).size.height * .065,
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('0053CB')),
                ),
                child: Text(
                  'Join Now — Create a new account',
                  style: TextStyle(
                      color: HexColor('FFFFFF'),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  navigateandFinish(context, SignUpScreen());
                },
              ),
            if (pageIndex == 2)
              TextButton(
                onPressed: () {
                  navigateandFinish(context, LoginScreen());
                },
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            color: HexColor('1E88E5'),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            color: HexColor('1565C0'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              )
          ],
        ),
      ),
    );
  }
}

Widget buildBoarding(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            model.image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          model.title,
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: HexColor('0053CB'),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: model.body1,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('1E88E5'),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: model.body2,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('1E88E5'),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: model.body3,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('1E88E5'),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
