import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/successScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customDropDown.dart';
import '../components/customFormField.dart';
import '../components/customTimeline.dart';
import '../theme/app_colors.dart';




class AddHouse extends StatefulWidget {
  const AddHouse({super.key});

  @override
  State<AddHouse> createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  final List<Widget> _steps = [
    AddHouseStep1(),
    AddHouseStep2(),
    AddHouseStep3(),
    AddHouseStep4()
  ];
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

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


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title:  Text(
          'Nouveau bien',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      backgroundColor: AppColors.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: List.generate(
                _steps.length,
                (index) => CustomTimeline(
                  index: index,
                  currentIndex: _currentIndex,
                  onTap: () => _onStepTapped(index),
                  isLast: index == _steps.length - 1,
                  stepsDesc: const [
                    "Informations\nsur le bien",
                    "Détail\ndu loyer",
                    "Photos\net vidéos",
                    "Disponibilité\net Autre",
                  ],
                ),
            ),
          ),
        //  CustomStepper(),
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
                    width: screenWidth / 3,
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
                  width: screenWidth / 3,
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


class AddHouseStep1 extends StatelessWidget {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

  AddHouseStep1({super.key});

  final List<Map<String, dynamic>> categoriesBien = [
    {"icon": Icons.house_outlined, "label": "Maison"},
    {"icon": Icons.business_outlined, "label": "Bureau"},
    {"icon": Icons.warehouse_outlined, "label": "Boutique"},
    {"icon": Icons.villa_outlined, "label": "Villa"},
    {"icon": Icons.apartment_outlined, "label": "Appart Meublé"},
    {"icon": Icons.event, "label": "Salle d'évènement"},
    {"icon": Icons.store_mall_directory, "label": "En Vente"},

  ];

  final List<Map<String, dynamic>> categorieForm = [] ;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  CustomTimelineList(),
          Padding(
            padding: const EdgeInsets.only(top: 34, left: 19, right: 19 ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Catégorie de biens",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ValueListenableBuilder<int?>(
                  valueListenable: _selectedIndex,
                  builder: (context, selectedIndex, _) {
                    return SizedBox(
                      height: screenHeight / 5.5,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesBien.length,
                        itemBuilder: (context, index) {
                          final category = categoriesBien[index];
                          final isSelected = selectedIndex == index;

                          return GestureDetector(
                            onTap: () {
                              _selectedIndex.value = index;
                            },
                            child: Container(
                              width: 90,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter ,
                                    child: Card(
                                      color: isSelected
                                          ? AppColors.btnPrimary
                                          : AppColors.formcolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: isSelected ? 6 : 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: Icon(
                                          category["icon"],
                                          color: isSelected
                                              ? AppColors.surface
                                              : AppColors.textSecondary,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      category["label"],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: isSelected
                                            ? AppColors.btnPrimary
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Column(
            children: [
              CustomDropdownField(
                title: 'Pays',
                items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
                hint: "Togo",
                selectedItem: selectedItem,
              ),
              CustomDropdownField(
                title: 'Ville',
                items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
                hint: "Ville",
                selectedItem: selectedItem,
              ),
              CustomDropdownField(
                title: 'Quartier',
                items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
                hint: "Quartier",
                selectedItem: selectedItem,
              ),
              CustomFormField(
                title: 'Géolocalisation',
                suffixicon: Icons.location_on_outlined,
                label: 'Avéto, Bè',
                controller: TextEditingController(),
              ),
              CustomDropdownField(
                title: 'Chambre',
                items: ['0', '1', '2', '3'],
                hint: "2",
                selectedItem: selectedItem,
              ),
              CustomDropdownField(
                title: 'Cuisine',
                items: ['0', '1', '2', '3'],
                hint: "1",
                selectedItem: selectedItem,
              ),
              CustomDropdownField(
                title: 'Salle de bain',
                items: ['0', '1', '2', '3'],
                hint: "1",
                selectedItem: selectedItem,
              ),
              CustomDropdownField(
                title: 'Salon',
                items: ['0', '1', '2', '3'],
                hint: "0",
                selectedItem: selectedItem,
              ),
              CustomDropdownField(
                title: 'Garage',
                items: ['0', '1', '2', '3'],
                hint: "0",
                selectedItem: selectedItem,
              ),
              SizedBox(height: 19,),
              CustomFormField(
                title: 'Taille en m²',
                label: '200',
                keyboardType: TextInputType.number,
                controller: TextEditingController(),
              ),
              SizedBox(height: 24,),
              SizedBox(
               // height: 150,
                child: CustomFormField(
                  maxlines: null,
                  title: 'Description',
                  label: 'Description',
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(height: 24,),
              CustomFormField(
                title: 'Titre',
                maxlines: 3,
                formheight: 65,
                label: 'Le titre à afficher sur votre bien',
                controller: TextEditingController(),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
                      "Cocher si le bien est neuf",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}



class AddHouseStep2 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  AddHouseStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 35,),

          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomFormField(
                  title: 'Montant du loyer (Fcfa)',
                  label: "35.000 ",
                  controller: _controller,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomDropdownField(
                  title: 'Fréquence',
                  items: ['/Mois', '/Année'],
                  hint: "/Mois",
                  selectedItem: selectedItem,

                ),
              ),
            ],
          ),

          SizedBox(height: 19,),

          CustomFormField(
            title: 'Caution (Fcfa)',
            label: '35.000',
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
          ),
          SizedBox(height: 19,),
          CustomFormField(
            title: 'Frais de visite (Fcfa)',
            label: '35.000',
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
          ),
          SizedBox(height: 19,),
          CustomFormField(
            title:'Frais suppléméntaire (Fcfa)' ,
            label: '35.000',
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
          ),
          SizedBox(height: 19,),
          SizedBox(
            height: 150,
            child: CustomFormField(
              title:  'Justificatif frais supplémentaire',
              label: 'Justificatif frais supplémentaire',
              maxlines: 20,
              formheight: 65,
              controller: TextEditingController(),
            ),
          ),
        ],
      ),
    );
  }
}


class AddHouseStep3 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  AddHouseStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 34,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 19.0),
             child: RichText(text:  const TextSpan(
              text: "Uploadez des images du bien pour permetre à vaux clients  de se faire une idée sur la qualité de votre bien.",
              style: TextStyle(
                color: AppColors.textPrimary
              ),
                children:  [
                  TextSpan(
                    text: "5",
                    style: TextStyle(
                      color: AppColors.btnPrimary,
                    )
                  ),
                  TextSpan(
                    text: " à",
                    style: TextStyle(
                      color: AppColors.textPrimary
                    ),
                  ),
                  TextSpan(
                      text: " 10 images",
                      style: TextStyle(
                        color: AppColors.btnPrimary
                      )
                  )
                ]
              ),
                       ),
           ),

          Padding(
            padding: const EdgeInsets.all(19),
            child: SizedBox(
              height: 160,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.textSecondary)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom:  15, right: 240),
                  child: smallIconBtn(
                    btnicon: Icon(Icons.add),
                    bottomTitle: SizedBox(),
                    btncolor: AppColors.formcolor,
                    height: 53,
                    width: 53,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: Text("Insérer le lien de votre vidéo afin de permettre à vos future locataire de faire une visite virtuelle."),
          ),
          SizedBox(height: 19,),
          CustomFormField(
              label: "Lien de votre vidéo",
              controller: _controller
          )
        ],
      ),
    );
  }
}


class AddHouseStep4 extends StatelessWidget {
  final ValueNotifier<List<String>> selectedTopicsNotifier = ValueNotifier([]);
  final List<String> topics = [
    'Climatiseur', 'Brasseur', 'Wifi', 'Cuisine équipé',
    'Compteur privé', 'Robinet', 'Puit à eau', 'Panneau solaire', 'Groupe électrogène'
  ];
   AddHouseStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 34,),
            Container(
              width: MediaQuery.of(context).size.width,
              child:  Text(
                  textAlign: TextAlign.left,
                  "Carastéristique suplémentaire"
              ),
            ),
            SizedBox(height: 19,),
            ValueListenableBuilder<List<String>>(
              valueListenable: selectedTopicsNotifier,
                builder: (context, selectedTopics, child) {
                  return Wrap(
                    children: topics.map((e) {
                      bool isSelected = selectedTopics.contains(e);
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              List<String> updatedList = List.from(selectedTopicsNotifier.value);
                              if (updatedList.contains(e)) {
                                updatedList.remove(e);
                              } else {
                                updatedList.add(e);
                              }
                              selectedTopicsNotifier.value = updatedList; // Assigner la nouvelle liste
                              print(updatedList);
                            },
                            child: Chip(
                              label: Text(e, style: TextStyle(
                                fontWeight: FontWeight.w600,
                                  color: isSelected ? AppColors.surface : AppColors.textPrimary,
                              ),),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                              ),
                              backgroundColor: isSelected ? AppColors.btnPrimary : AppColors.formcolor,
                              color: isSelected
                              ? const WidgetStatePropertyAll(AppColors.btnPrimary)
                              : WidgetStatePropertyAll(AppColors.formcolor) ,
                              side: isSelected
                              ? BorderSide(color: AppColors.btnPrimary)
                              : BorderSide(color: AppColors.formcolor),
                            ),
                          ),
                      );
                    }).toList(),
                  );
                }
            ),

            SizedBox(height: 28,),

            Container(
              width: MediaQuery.of(context).size.width,
              child:  Text(
                  "Votre horaire de visite"
              ),
            ),
            SizedBox(height: 17,),

            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Ajouter un collaborateur pour gérer ce bien"),
                ),
                SizedBox(height: 11,),
                SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.textSecondary)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom:  15, left: 16, right: 16 ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              smallIconBtn(
                                btnicon: Icon(Icons.add),
                                bottomTitle: SizedBox(),
                                btncolor: AppColors.formcolor,
                                height: 35,
                                width: 65,
                              ),
                              Text(
                                "premium",
                                style: TextStyle(
                                    color: AppColors.formcolor,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomButton(
                                btnText: "Djossou Ekoevi",
                                btncolor: Color(0xFFC1E3FC),
                                onPressed: (){
                                },
                               // width: 130,
                                height: 18,
                                lendingWidget: SizedBox(),
                                trailingWidget: SizedBox()),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

