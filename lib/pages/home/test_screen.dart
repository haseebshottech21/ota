import 'package:flutter/material.dart';
// import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/data/response/status.dart';
import 'package:ota/view_model/auth_view_model.dart';
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

  getData() {
    final sp = context.read<AuthViewModel>();
    sp.getDataFromSharedPrefrence();
  }

  @override
  void initState() {
    super.initState();
    getMoviesList();
    // getData();
  }

  getMoviesList() {
    final provider = Provider.of<HomeViewModel>(context, listen: false);
    provider.fetchMovieListApi();
  }

  @override
  Widget build(BuildContext context) {
    // final sp = context.watch<AuthViewModel>();
    // final homeViewModel = Provider.of<HomeViewModel>(context);

    // print(homeViewModel.movieList.status);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Movies List'),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     CircleAvatar(
      //       backgroundColor: Colors.white,
      //       backgroundImage: NetworkImage('${sp.imageUrl}'),
      //       radius: 50,
      //     ),
      //     const SizedBox(height: 20),
      //     Text(
      //       'Welcome ${sp.name}',
      //       style: const TextStyle(
      //         fontSize: 15,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     Text(
      //       'Email ${sp.email}',
      //       style: const TextStyle(
      //         fontSize: 15,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     Text(
      //       'UID ${sp.uid}',
      //       style: const TextStyle(
      //         fontSize: 15,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         const Text('PROVIDER'),
      //         const SizedBox(width: 5),
      //         Text(
      //           '${sp.provider}'.toUpperCase(),
      //           style: const TextStyle(color: Colors.red),
      //         )
      //       ],
      //     ),
      //     const SizedBox(height: 10),
      //     TextButton(
      //       onPressed: () {
      //         sp.userSignOut();
      //         Navigator.pushNamed(context, RouteName.login);
      //       },
      //       child: const Text('SIGNOUT'),
      //     )
      //   ],
      // ),
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
