import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/customAppBar.dart';
import '../../components/customButton.dart';
import '../../components/customCuntryFormField.dart';
import '../../components/customFormField.dart';
import '../../theme/app_colors.dart';
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

  final List<String> _stepsDesc = [];


  @override
  void initState() {
    super.initState();
    _steps.addAll([
        RegisterAgentStep1(onNext: _onNext),
        RegisterMooverStep2(onNext: _onNext)
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
                    (index) => StepperComponent(
                  index: index,
                  currentIndex: _currentIndex,
                  onTap: () => _onStepTapped(index),
                  isLast: index == _steps.length - 1,
                  stepsDesc: [
                    "Informations \n Personnelles",
                    "Informations \n de vérification",
                    "Informations \n de connexion",
                    "Informations sur \n les services",
                    "Conditions \n et politiques",
                  ],
                ),
              ),
            ),
          ),

          // PAGEVIEW
          Expanded(
            child: PageView.builder(
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
                    width: 100,
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
                  width: 100,
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


class RegisterMooverStep2 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterMooverStep2
({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          SizedBox(height: 34,),

          Padding(
            padding: const EdgeInsets.all(19.0),
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
            padding: const EdgeInsets.all(19.0),
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
                      btnText: "Importer votre permis de conduire",
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

          SizedBox(height: 12,),

          CustomFormField(
              prefixicon: Icons.tag_outlined,
              label: "NIF de l'agence",
              controller: _controller
          ),

          CustomFormField(
              prefixicon: Icons.tag_outlined,
              label: "Immatriculation du véhicule",
              controller: _controller
          ),


          /*  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              height: 60,
              width: 354,
              fontsize: 18,
              btnText: "Suivant",
              onPressed: onNext,
              lendingWidget: SizedBox(),
              trailingWidget: const SizedBox(),
              textColor: Colors.white,
              btncolor: AppColors.btnPrimary,
            ),
          ),*/
        ],
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

            CustomFormField(
                prefixicon: Icons.person_outlined,
                label: "Prénom",
                controller: _controller
            ),

            CustomFormField(
                prefixicon: Icons.real_estate_agent_outlined,
                label: "Nom de l'agence",
                controller: _controller
            ),

            SizedBox(height: 12,),

            CustomCountryFormField(),

            SizedBox(height: 12,),

            CustomFormField(
                prefixicon: Icons.email_outlined,
                label: "Email",
                controller: _controller
            ),

            CustomFormField(
                prefixicon: Icons.location_on_outlined,
                label: "Adresse",
                controller: _controller
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 30, left: 19, right: 19),
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

            /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: CustomButton(
                height: 60,
                width: 354,
                fontsize: 18,
                btnText: "Suivant",
                onPressed: onNext,
                lendingWidget: SizedBox(),
                trailingWidget: const SizedBox(),
                textColor: Colors.white,
                btncolor: AppColors.btnPrimary,
              ),
            ),*/

            RichText(text: TextSpan(
                text:  "J'ai un compte ",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "Je me connecte",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]
            )),

            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}



class StepperComponent extends StatelessWidget {
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;
  final List<String> stepsDesc;

  StepperComponent({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    this.isLast = false,
    required this.stepsDesc,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = index == currentIndex;
    bool isCompleted = index < currentIndex;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: isCompleted ? AppColors.btnPrimary : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.btnPrimary : AppColors.formiconcolor,
                  ),
                  child: isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 16)
                      : Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: isCompleted ? AppColors.btnPrimary : Colors.grey,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isCompleted ? AppColors.btnPrimary : Colors.grey,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 5, ),
            child: Text(
              stepsDesc[index],
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 9,
                fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}