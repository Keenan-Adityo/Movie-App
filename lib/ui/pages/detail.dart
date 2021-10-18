part of 'pages.dart';

class DetailScreen extends StatelessWidget {
  final movie;

  const DetailScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Header(size: size, movie: movie),
        ],
      ),
    );
  }
}

