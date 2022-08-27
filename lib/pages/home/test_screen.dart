import 'package:flutter/material.dart';
import 'package:ota/data/response/status.dart';
import 'package:ota/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  // final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

  // HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    getMoviesList();
    super.initState();
  }

  getMoviesList() {
    final provider = Provider.of<HomeViewModel>(context, listen: false);
    provider.fetchMovieListApi();
  }

  @override
  Widget build(BuildContext context) {
    // final homeViewModel = context.watch<HomeViewModel>();
    // final homeViewModel = Provider.of<HomeViewModel>(context);

    // print(homeViewModel.movieList.status);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Movies List'),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, _) {
          switch (value.movieList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                child: Text(value.movieList.message.toString()),
              );
            case Status.COMPLETE:
              final movie = value.movieList.data!.movies;
              return ListView.builder(
                itemCount: movie!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(movie[index].title.toString()),
                    ),
                  );
                },
              );
            default:
              return errorRoute();
          }
        },
      ),
    );
  }

  static errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('No route defined'),
          ),
        );
      },
    );
  }
}
