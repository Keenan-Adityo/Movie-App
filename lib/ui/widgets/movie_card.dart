part of 'widgets.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
            },
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) => buildMovieSlider(index)),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          // value = index - _pageController.page; // animation belum ditambahin
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          opacity: initialPage == index ? 1 : 0.4,
          duration: Duration(milliseconds: 350),
          child: Transform.rotate(
              angle: math.pi * value, child: MovieCard(movie: movies[index])),
        );
      });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'detail', arguments: movie),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [kDefaultShadow],
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(movie.poster),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                movie.title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/star_fill.svg",
                  height: 20,
                ),
                SizedBox(
                  width: kDefaultPadding / 2,
                ),
                Text(
                  "${movie.rating}",
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
