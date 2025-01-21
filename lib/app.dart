import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbex_pro/managers/bloc/menu_manager_bloc.dart';
import 'package:urbex_pro/managers/bloc/menu_manager_state.dart';
import 'package:urbex_pro/screens/chooseProfileScreen.dart';
import 'package:urbex_pro/screens/agentImmoHome.dart';
import 'package:urbex_pro/screens/recapAgendaScreen.dart';
import 'package:urbex_pro/screens/userProfileScreen.dart';
import 'package:urbex_pro/screens/walletScreen.dart';
import 'package:urbex_pro/screens/widgetScreen.dart';
import 'package:urbex_pro/widgets/nav_bar_widget.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuManagerBloc(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: BlocBuilder<MenuManagerBloc, MenuManagerState>(
          builder: (context, state) {
            // Affiche l'écran actif en fonction de l'index
            return IndexedStack(
              index: state.currentIndex,
              children:  [
                AgentImmoHomeScreen(),
                RecapAgendaScreen(),
                WalletScreen(),
                UserProfileScreen(),
              ],
            );
          },
        ),
        bottomNavigationBar: const NavbarWidget(),
      ),
    );
  }
}
