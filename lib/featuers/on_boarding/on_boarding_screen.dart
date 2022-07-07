import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/componat.dart';
import '../login/presentation/pages/screen_login.dart';
import '../register_screen/ragister_screen.dart';


class BordingModel {
  final String image;
  final String title;
  final String body;

  BordingModel({required this.image, required this.title, required this.body});
}

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  //3shan at7km fel zorar eno yn2lne mn bordingmodel le boardingmodel tania


  var boardController = PageController();

  List<BordingModel> boarding = [
    BordingModel(
      image: 'assets/images/1.gif',
      title: 'Shop Anything',
      body: 'Find you desired products form \n thousands of products !',
    ),
    BordingModel(
      image: 'assets/images/2.gif',
      title: 'Order Easily',
      body: 'Easily order any products \n you want to buy !',
    ),
    BordingModel(
      image: 'assets/images/3.gif',
      title: 'Fast Deliver',
      body:
          'Order will be delivered on your doorstep \n in quickest time possible !',
    ),
  ];

  bool isLast = false;



  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
            padding:  EdgeInsets.symmetric(horizontal:16.w ,vertical: 10.h  ),
            child:Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: InkWell(
                    onTap: (){
                      navigateTo(context, LoginScreen());
                    },
                    child: Container(

                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                            'skip',
                            style: TextStyle(fontSize: 16,color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '7',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade300
                      ),
                    ),
                    Text(
                      'Krave',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal
                      ),
                    ),
                  ],
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
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                    activeDotColor: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        15
                    ),
                  ),
                  child: MaterialButton(
                    color: Colors.teal,
                    height: 52.0,
                    onPressed: () {
                      if (isLast) {
                        navigateTo(context,  LoginScreen());
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, const RegisterScreen());
                        },
                        child: const Text(
                          'Sign UP',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),

                    // FloatingActionButton(
                    //   onPressed: ()
                    //   child: const Icon(Icons.arrow_forward_ios),
                    // ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget buildBoardingItem(BordingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage(model.image),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      );
}
