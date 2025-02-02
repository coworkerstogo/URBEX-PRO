import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> views;
  final Color tabBackgroundColor;
  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;
  final double tabHeight;
  final double indicatorWeight;
  final Widget Function(BuildContext, int)? itemBuilder;
  final int itemCount;

  CustomTabBar({
    required this.tabTitles,
    required this.views,
    this.tabBackgroundColor = Colors.grey,
    this.indicatorColor = Colors.purple,
    this.labelColor = Colors.white,
    this.unselectedLabelColor = Colors.black,
    this.tabHeight = 28.0,
    this.indicatorWeight = 2.5,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ContainedTabBarView(
          tabs: tabTitles.map((title) => Text(title)).toList(),
          tabBarProperties: TabBarProperties(
            background: Container(
              height: tabHeight,
              decoration: BoxDecoration(
                color: tabBackgroundColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            indicator: BoxDecoration(
              color: indicatorColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: tabHeight,
            indicatorColor: Colors.white,
            indicatorWeight: indicatorWeight,
            labelColor: labelColor,
            unselectedLabelColor: unselectedLabelColor,
          ),
          views: views,
          onChange: (index) => print("Tab switched to: $index"),
        ),
      ),
    );
  }
}