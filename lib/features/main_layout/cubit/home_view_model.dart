import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/features/main_layout/cubit/home_states.dart';

import '../../products_screen/presentation/screens/products_screen.dart';
import '../favourite/presentation/favourite_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  //todo: hold data - handle logic
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductsScreen(),
    FavouriteScreen(),
    ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialState());
    currentIndex = selectedIndex;
    emit(ChangeSelectedIndexState());
  }
}
