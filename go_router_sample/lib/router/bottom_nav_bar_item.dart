import 'package:flutter/material.dart';
import 'package:go_router_sample/router/route_path.dart';
import 'package:go_router_sample/screens/product/product_screen.dart';
import 'package:go_router_sample/screens/search/search_screen.dart';
import 'package:go_router_sample/screens/profile/profile_screen.dart';

enum BottomNavBarItem {
  screenA(
    label: "Product",
    icon: Icons.list,
    screen: ProductScreen(),
    path: RoutePath.productPath,
  ),
  screenB(
    label: "Search",
    icon: Icons.search,
    screen: SearchScreen(),
    path: RoutePath.searchPath,
  ),
  screenC(
    label: "Profile",
    icon: Icons.person,
    screen: ProfileScreen(),
    path: RoutePath.profilePath,
  );

  const BottomNavBarItem({
    required this.label,
    required this.icon,
    required this.screen,
    required this.path,
  });

  final String label;
  final IconData icon;
  final Widget screen;
  final String path;
}
