import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customTimeline.dart';
import '../../components/customAppBar.dart';
import '../../components/customButton.dart';
import '../../components/customCuntryFormField.dart';
import '../../components/customDropDown.dart';
import '../../components/customFormField.dart';
import '../../theme/app_colors.dart';
import '../loginScreen.dart';
import '../successScreen.dart';



class RegisterMooverScreen extends StatefulWidget {
  const RegisterMooverScreen({super.key});

  @override
  State<RegisterMooverScreen> createState() => _RegisterMooverScreenState();
}


class _RegisterMooverScreenState extends State<RegisterMooverScreen> {
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
        RegisterAgentStep1(onNext: _onNext),
        RegisterMooverStep2(onNext: _onNext),
        RegisterMooverStep3(onNext: _onNext),
        RegisterMooverStep4(onNext: _onNext,)
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
            padding:const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: List.generate(
                _steps.length,
                    (index) => CustomTimeline(
                  index: index,
                  currentIndex: _currentIndex,
                  onTap: () => _onStepTapped(index),
                  isLast: index == _steps.length - 1,
                  stepsDesc: const [
                    "Info\nPersonnelles",
                    "Info\nde vérification",
                    "Info\nde connexion",
                    "Info\nsur services",
                    "Conditions\n et politiques",
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



class RegisterMooverStep4 extends StatelessWidget {
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterMooverStep4
      ({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 34,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text(
                    "Choisissez votre type de véhicule",
                  ),
                ),
              ],
            ),

            SizedBox(height: 19,),

            Text(
              "Il reste un élément à mettre",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),

            SizedBox(height: 19,),

            CustomFormField(
                prefixicon: Icons.directions_car_filled_outlined,
                label: "Model du véhicule",
                controller: _controller
            ),

            SizedBox(height: 19,),

            CustomFormField(
                prefixicon: Icons.tag_outlined,
                label: "Capacité de chargement",
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
                        btnText: "Importer des photos du \n véhicule",
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

            SizedBox(height: 12,),

            CustomDropdownField(
              items: ['Maritime', 'Savane', 'Kara', 'Plateaux', 'Centrale'],
              hint: "Régions couvertes",
              selectedItem: selectedItem,
            ),

            CustomDropdownField(
              items: ['Maritime', 'Savane', 'Kara', 'Plateaux', 'Centrale'],
              hint: "villes couvertes",
              selectedItem: selectedItem,
            ),

            SizedBox(height: 19,),
          ],
        ),
      ),
    );
  }
}


class RegisterMooverStep3 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterMooverStep3({super.key, required this.onNext});

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
            label: "Confirmation de mot de passe",
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



class RegisterMooverStep2 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterMooverStep2
({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 34,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0, ),
              child: SizedBox(
                height: 140,
                width: 380,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.textSecondary)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 72, bottom:  15, left: 15, right: 15),
                    child: CustomButton(
                        btnText: "Importer vos pièces d’identité",
                        btncolor: AppColors.surface,
                        bordersideColor: AppColors.btnPrimary,
                        onPressed: () {
                          // Logique pour le bouton de soumission
                          print('Email: ');
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

            SizedBox(height: 19,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: SizedBox(
                height: 140,
                width: 380,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.textSecondary)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 72, bottom:  15, left: 15, right: 15),
                    child: CustomButton(
                        btnText: "Importer votre permis de \n conduire",
                        btncolor: AppColors.surface,
                        bordersideColor: AppColors.btnPrimary,
                        onPressed: () {
                          // Logique pour le bouton de soumission
                          print('Email: ');
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
        
            SizedBox(height: 19,),
        
            CustomFormField(
                prefixicon: Icons.tag_outlined,
                label: "NIF de l'agence",
                controller: _controller
            ),

            SizedBox(height: 19,),
            CustomFormField(
                prefixicon: Icons.tag_outlined,
                label: "Immatriculation du véhicule",
                controller: _controller
            ),
        
            SizedBox(height: 19,),
          ],
        ),
      ),
    );
  }
}


class RegisterAgentStep1 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterAgentStep1({super.key, required this.onNext });

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

            CustomFormField(
                prefixicon: Icons.real_estate_agent_outlined,
                label: "Nom de l'agence",
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
                prefixicon: Icons.location_on_outlined,
                label: "Adresse",
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
  }
}

