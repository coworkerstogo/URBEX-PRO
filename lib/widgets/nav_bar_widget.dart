import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:urbex_pro/managers/bloc/menu_manager_bloc.dart';
import 'package:urbex_pro/managers/bloc/menu_manager_event.dart';
import 'package:urbex_pro/managers/bloc/menu_manager_state.dart';
import 'package:urbex_pro/theme/app_colors.dart';


class NavbarWidget extends StatelessWidget {
  const NavbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return LayoutBuilder(
            builder: (context, constraints) {
            print("Constraints: $constraints");
            return BlocBuilder<MenuManagerBloc, MenuManagerState>(
              builder: (context, state) {
                return Expanded(
                 // width: MediaQuery.of(context).size.width,
                  //height: 90,
                  child: DotNavigationBar(
                    marginR: EdgeInsets.symmetric(horizontal: 20),
                    paddingR: EdgeInsets.all(15),
                    //itemPadding : EdgeInsets.symmetric(horizontal: 30),
                    enableFloatingNavBar : true,
                    currentIndex: state.currentIndex,
                    onTap: (index) {
                      context.read<MenuManagerBloc>().add(MenuItemSelected(index));
                    },
                    dotIndicatorColor: Colors.white,
                    backgroundColor: AppColors.menuPrimary,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.white,
                    items: [
                      DotNavigationBarItem(
                        icon: const Icon(Icons.home,),
                        //selectedColor: Colors.blue,
                      ),
                      DotNavigationBarItem(
                        icon: const Icon(Icons.bar_chart),
                        //selectedColor: Colors.green,
                      ),
                      DotNavigationBarItem(
                        icon: const Icon(Icons.wallet),
                        //selectedColor: Colors.orange,
                      ),
                      DotNavigationBarItem(
                        icon: const Icon(Icons.person),
                        //selectedColor: Colors.purple,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        );
      }
    );
  }
}
