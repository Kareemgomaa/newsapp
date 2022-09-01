
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/search_screan.dart';
import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import 'news_cubit/cubit.dart';
import 'news_cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubitt, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubitt.get(context);
          return Scaffold(
            body: cubit.screens[cubit.selectedIndex],
            appBar: AppBar(
              title: Text(
                "News App",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TAN',
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                    AppCubit.get(context).changeMode();
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.selectedIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changebottomnavbar(index);
              },
            ),
          );
        });
  }
}
