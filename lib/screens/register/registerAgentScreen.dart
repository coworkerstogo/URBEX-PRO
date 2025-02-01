import 'package:flutter/material.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/screens/successScreen.dart';
import '../../components/customButton.dart';
import '../../components/customCuntryFormField.dart';
import '../../components/customFormField.dart';
import '../../theme/app_colors.dart';
import '../../components/customAppBar.dart';



class CustomTimelineList extends StatefulWidget {
  @override
  State<CustomTimelineList> createState() => _CustomTimelineListState();
}

class _CustomTimelineListState extends State<CustomTimelineList> {
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

  // Fonction pour aller à une étape spécifique via le stepper
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
      RegisterAgentStep2(onNext: _onNext),
      RegisterAgentStep3(onNext: _onNext),
      RegisterAgentStep4(onNext: _onNext),
      ConditionsPolitiquesScreen(onNext: _onNext)
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                    "Informations  \n sur services",
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



class ConditionsPolitiquesScreen extends StatelessWidget {
  final VoidCallback onNext;
  ConditionsPolitiquesScreen({super.key, required this.onNext});
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.surface,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: RichText(
                  text:const TextSpan(
                    text: "01  ",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "Type de lieu",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                      "It has survived not only five centuries, but also the leap into electronic. \n \n"
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cities of the word in classical literature, discovered the undoubtedly source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of <<de Finibus Bonorum et Malorum >> (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, <<Lorem ipsum dolor sit amet..>>, comes from a line in section 1.10.32.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: RichText(
                  text:const TextSpan(
                    text: "02  ",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "Type de lieu",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                      "It has survived not only five centuries, but also the leap into electronic. \n \n"
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cities of the word in classical literature, discovered the undoubtedly source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of <<de Finibus Bonorum et Malorum >> (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, <<Lorem ipsum dolor sit amet..>>, comes from a line in section 1.10.32.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [

                  // Utilisation de ValueListenableBuilder pour réagir aux changements
                  ValueListenableBuilder<bool>(
                    valueListenable: isChecked,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value,
                        activeColor: AppColors.btnPrimary,
                        onChanged: (newBool) {
                          isChecked.value = newBool!;
                        },
                      );
                    },
                  ),
                  const Text(
                    "J’accepte les conditions",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              const SizedBox(height: 30,),

            /*  CustomButton(
                height: 63,
                width: 354,
                fontsize: 18,
                btnText: "Finaliser mon inscription",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountValidateScreen(),
                    ),
                  );
                },
                lendingWidget: SizedBox(),
                trailingWidget: const SizedBox(),
                textColor: Colors.white,
                btncolor: Colors.grey.shade300,
              ),*/

            ],
          ),
        ),
      ),
    );
  }
}



class RegisterAgentStep4 extends StatelessWidget {
  final VoidCallback onNext;
  RegisterAgentStep4({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,

      body:  Column(
        children: [

          SizedBox(height: 30,),
          Text("Step 4")

        ],
      ),
    );
  }
}


class RegisterAgentStep3 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterAgentStep3({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          SizedBox(height: 34,),

          CustomFormField(
              prefixicon: Icons.person_outlined,
              label: "Nom d'utilisateur",
              controller: _controller
          ),

          SizedBox(height: 19,),

          CustomFormField(
              prefixicon: Icons.key_outlined,
              label: "Mot de passe",
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
          ), */
        ],
      ),
    );
  }
}



class RegisterAgentStep2 extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _controller = TextEditingController();
  RegisterAgentStep2({super.key, required this.onNext});

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

          SizedBox(height: 12,),

          CustomFormField(
              prefixicon: Icons.tag_outlined,
              label: "Numéro de Licence",
              controller: _controller
          ),

          SizedBox(height: 19,),

          CustomFormField(
              prefixicon: Icons.tag_outlined,
              label: "NIF de l'agence",
              controller: _controller
          ),
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
                  fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.w400,
                ),
                textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
