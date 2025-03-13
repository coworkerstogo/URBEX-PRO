import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customTimeline.dart';
import '../../components/customAppBar.dart';
import '../../components/customButton.dart';
import '../../components/customCuntryFormField.dart';
import '../../components/customFormField.dart';
import '../../theme/app_colors.dart';
import '../loginScreen.dart';
import '../successScreen.dart';


class RegisterSellerProductScreen extends StatefulWidget {
  const RegisterSellerProductScreen({super.key});

  @override
  State<RegisterSellerProductScreen> createState() => _RegisterSellerProductScreen();
}

class _RegisterSellerProductScreen extends State<RegisterSellerProductScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  // Fonction pour aller à l'étape suivante
  void _onNext() {
    if (_currentIndex < _steps.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.jumpToPage(_currentIndex);
    }
  }

  void _onPrevious(){
    if(_currentIndex < _steps.length ){
      setState(() {
        _currentIndex--;
      });
      _pageController.jumpToPage(_currentIndex);
    }
  }
  void _onStepTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  // Liste des étapes avec onNext en paramètre
  final List<Widget> _steps = [];


  @override
  void initState() {
    super.initState();
    _steps.addAll([
      RegisterSellerProductScreenStep1(onNext: _onNext),
      RegisterSellerProductScreenStep2(onNext: _onNext),
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title: Text(
          'Register',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      backgroundColor: AppColors.surface,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TIMELINE
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: List.generate(
                _steps.length,
                    (index) => CustomTimeline(
                  index: index,
                  currentIndex: _currentIndex,
                  onTap: () => _onStepTapped(index),
                  isLast: index == _steps.length - 1,
                  stepsDesc: const [
                    "Informations\nPersonnelles",
                    "Informations\nde vérification",
                  ],
                ),
              ),
            ),
          ),

          // PAGEVIEW
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: _steps.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _steps[index];
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(_currentIndex > 0)
                  CustomButton(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 3,
                    fontsize: 18,
                    btnText: "Précédent",
                    onPressed: _onPrevious,
                    lendingWidget: SizedBox(),
                    trailingWidget: SizedBox(),
                    textColor: Colors.white,
                    btncolor: AppColors.btnPrimary,
                  ),

                CustomButton(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 3,
                  fontsize: 18,
                  btnText: _currentIndex == _steps.length -1 ? "Terminer" : "Suivant",
                  onPressed: _currentIndex == _steps.length - 1 ? (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(),
                      ),
                    );
                  } : _onNext,
                  lendingWidget: SizedBox(),
                  trailingWidget: SizedBox(),
                  textColor: Colors.white,
                  btncolor: AppColors.btnPrimary,
                ),

              ],
            ),
          ),

          SizedBox(height: 10,)
        ],
      ),
    );
  }
}



class RegisterSellerProductScreenStep2 extends StatelessWidget{
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterSellerProductScreenStep2({super.key, required this.onNext });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 34,),
          CustomFormField(
            prefixicon: Icons.person_outlined,
            label: "Nom d’utilisateur",
            controller: _controller,
          ),

          SizedBox(height: 19,),

          CustomFormField(
            prefixicon: Icons.key_outlined,
            label: "Mot de passe",
            controller: _controller,
          ),

          SizedBox(height: 19,),

          CustomFormField(
            prefixicon: Icons.key_outlined,
            label: "Confirmer le mot de passe",
            controller: _controller,
          ),

          const SizedBox(
            height: 50,
          ),

        ],
      ),
    );
  }
}


class RegisterSellerProductScreenStep1 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterSellerProductScreenStep1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 34,),

            CustomFormField(
                prefixicon: Icons.person_outlined,
                label: "Nom",
                controller: _controller
            ),

            SizedBox(height: 19,),

            CustomFormField(
                prefixicon: Icons.person_outlined,
                label: "Prénom",
                controller: _controller
            ),
            SizedBox(height: 19,),

            CustomCountryFormField(),

            SizedBox(height: 19,),

            CustomFormField(
                prefixicon: Icons.email_outlined,
                label: "Email",
                controller: _controller
            ),


            SizedBox(height: 19,),

            CustomFormField(
                prefixicon: Icons.real_estate_agent_outlined,
                label: "Nom de votre entreprise",
                controller: _controller
            ),

            SizedBox(height: 19,),

            CustomFormField(
                prefixicon: Icons.tag_outlined,
                label: "NIF de l'agence",
                controller: _controller
            ),


            Padding(
              padding: const EdgeInsets.only(top: 19, left: 19, right: 19),
              child: SizedBox(
                height: 140,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.textSecondary)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 72, bottom:  15, left: 15, right: 15),
                    child: CustomButton(
                        btnText: "Importer une photo de profile",
                        btncolor: AppColors.surface,
                        bordersideColor: AppColors.btnPrimary,
                        onPressed: () {

                        },
                        lendingWidget: Icon(
                          Icons.add,
                          color: AppColors.textSecondary,
                        ),
                        textColor: AppColors.textSecondary,
                        trailingWidget: SizedBox()
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("J'ai un compte ",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          )
                      );
                    },
                    child: Text(
                      "Je me connecte",
                      style: TextStyle(
                        color: AppColors.btnPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                )
              ],
            ),

            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }}

