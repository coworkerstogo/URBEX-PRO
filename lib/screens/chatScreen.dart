import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';






class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Colors.white,
          ),
          title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,),
              child: Row(
                children: [
                  CircleAvatar(
                    radius : 26,
                    backgroundImage : Image.asset("assets/pictures/Rectangle_img").image,
                    backgroundColor : AppColors.orangeAccent,
                  ),
                  const SizedBox(width: 20,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "ATTISSO Julien",
                          style : TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          )
                      ),
                      Text(
                        "Active now",
                        style: TextStyle(
                          color: AppColors.orangeAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20,),
                  const Icon(
                    Icons.video_call_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.call_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          backgroundColor: AppColors.btnPrimary,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Today"),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(
                              left:
                              MediaQuery.of(context).size.width / 2.2),
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              color: AppColors.btnPrimary,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              )),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Hello! Jhon abraham",
                            style: TextStyle(color: AppColors.surface),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "09:25 AM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF797C7B80),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: Image.asset(
                                  "assets/pictures/Rectangle_img")
                                  .image,
                              backgroundColor: AppColors.orangeAccent,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              "Jhon Abraham",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 6,
                              left: 60),
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF2F7FB),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Hello ! Nazrul How are you?",
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          //    margin: EdgeInsets.only(left: 150),
                          child: const Text(
                            textAlign: TextAlign.end,
                            "09:25 AM",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF797C7B80),
                            ),
                          ),
                        )
                      ]
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(
                              left:
                              MediaQuery.of(context).size.width / 2.2),
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              color: AppColors.btnPrimary,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              )),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "You did your job well!",
                            style: TextStyle(color: AppColors.surface),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "09:25 AM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF797C7B80),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: Image.asset(
                                  "assets/pictures/Rectangle_img")
                                  .image,
                              backgroundColor: AppColors.orangeAccent,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              "Jhon Abraham",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 6,
                              left: 60),
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF2F7FB),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Have a great working week!!",
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(
                              right:
                              MediaQuery.of(context).size.width / 2.6,
                              left: 60),
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF2F7FB),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Hope you like it",
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7.5,
                          child: const Text(
                            textAlign: TextAlign.end,
                            "09:25 AM",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF797C7B80),
                            ),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(
                              left:
                              MediaQuery.of(context).size.width / 2.5),
                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                              color: AppColors.btnPrimary,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          child: Row(children: [
                            const Icon(
                              Icons.play_circle_fill_outlined,
                              color: Color(0xFFFFFFFF),
                              size: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Transform.scale(
                              scaleX: 1.5, // Allonge horizontalement
                              scaleY: 0.7, // Ne change pas la hauteur
                              child: const Icon(
                                Icons.graphic_eq,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Transform.scale(
                              scaleX: 1.5, // Allonge horizontalement
                              scaleY: 0.7, // Ne change pas la hauteur
                              child: const Icon(
                                Icons.graphic_eq,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Transform.scale(
                              scaleX: 1.5, // Allonge horizontalement
                              scaleY: 0.7, // Ne change pas la hauteur
                              child: const Icon(
                                Icons.graphic_eq,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "00:16",
                              style: TextStyle(color: Color(0xFFFFFFFF)),
                            )
                          ]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "09:25 AM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF797C7B80),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey[600]),
                  onPressed: () {}, // Action pour les fichiers
                ),
                Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        //  keyboardType: ,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.fildbackcolor, // Texte du label
                          labelStyle: const TextStyle(color: AppColors.formiconcolor),
                          hintText: "Écrire un message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16), // Rayon du champ
                            borderSide: const BorderSide(color: AppColors.btnPrimary), // Couleur du bord
                          ),
                          suffixIcon: const Icon(
                            Icons.file_copy_outlined,
                            color: Color(0xFF000E08),
                            size: 20,
                          ),
                        ),
                      ),
                    )
                ),
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFF000E08),
                    size: 20,
                  ),
                  onPressed: () {}, // Action pour la caméra
                ),
                IconButton(
                  icon: const Icon(
                    Icons.mic_none_outlined,
                    color: Color(0xFF000E08),
                    size: 20,
                  ),
                  onPressed: () {}, // Action pour le micro
                ),
                /* IconButton(
                    icon: Icon(Icons.send, color: AppColors.textPrimary),
                    onPressed: () {}, // Action pour envoyer le message
                ),*/
              ],
            ),
          ),
        )
    );

  }
}
