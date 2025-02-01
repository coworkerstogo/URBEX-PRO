import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:urbex_pro/screens/agentImmoHome.dart';
import '../theme/app_colors.dart';




class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      _currentIndex.value = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {
      //  "color": AppColors.surface,
        "image": "assets/pictures/amico.svg",
        "title": "Bienvenue !",
        "description":
        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen amet.., comes from a line in section 1.10.32.."
      },
      {
      //  "color": AppColors.lightPurple,
        "image": "assets/pictures/pana.svg",
        "title": "Fonctionnalités incroyables",
        "description":
        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen amet.., comes from a line in section 1.10.32."
      },
      {
      //  "color": AppColors.greenAccent,
        "image": "assets/pictures/amico.svg",
        "title": "Prêt à commencer ?",
        "description":
        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen amet.., comes from a line in section 1.10.32."
      },
    ];

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, _) {
          return Container(
           // color: pages[currentIndex]["color"],
            child: Stack(
              children: [
                OnBoardingAnimation(
                  controller: _pageController,
                  pages: pages.map((page) {
                    return _buildPageContent(
                      svgPath: page["image"],
                      title: page["title"],
                      description: page["description"],
                    );
                  }).toList(),
                  indicatorDotHeight: 7.0,
                  indicatorDotWidth: 7.0,
                  indicatorActiveDotColor: AppColors.btnPrimary,
                  indicatorType: IndicatorType.expandingDots,
                  indicatorPosition: IndicatorPosition.bottomCenter,
                  indicatorSwapType: SwapType.normal,
                ),
                // Bouton "Skip" sous les indicateurs
                Positioned(
                  bottom: 120,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Bouton "Suivant" ou "Terminer"
                Positioned(
                  bottom: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex < pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.btnPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ),
                // Bouton "Retour" sous forme circulaire
                if (currentIndex > 0)
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageContent({
    required String svgPath,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 100),
        SvgPicture.asset(
          svgPath,
          height: 300,
          fit: BoxFit.contain,
        ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const SizedBox(height: 40),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      )
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AgentImmoHomeScreen();
  }
}
