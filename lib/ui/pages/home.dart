

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/styles.dart';
import 'package:movie_app/ui/widgets/category.dart';
import 'package:movie_app/ui/widgets/genres_card.dart';
import 'package:movie_app/ui/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          CategoryList(),
          GenresHome(),
          SizedBox(
            height: kDefaultPadding,
          ),
          MovieCarousel(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        padding: EdgeInsets.only(left: kDefaultPadding),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        )
      ],
    );
  }
}
