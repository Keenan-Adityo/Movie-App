import 'package:flutter/material.dart';
import 'package:movie_app/styles.dart';
import 'package:movie_app/ui/widgets/cast_card.dart';
import 'package:movie_app/ui/widgets/detailheader.dart';
import 'package:movie_app/ui/widgets/genres_card.dart';
import 'package:movie_app/ui/widgets/titleandfav.dart';

class DetailScreen extends StatelessWidget {
  final movie;

  const DetailScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(size: size, movie: movie),
            TitleandFav(movie: movie),
            GenresDetail(movie: movie),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              child: Text(
                "Plot Summary",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                movie.plot,
                style: TextStyle(color: Color(0xFF737599)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cast & Crew",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movie.cast.length,
                        itemBuilder: (context, index) =>
                            CastCard(cast: movie.cast[index])),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


