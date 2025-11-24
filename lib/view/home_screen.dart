import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/status.dart';
import 'package:mvvm_provider/utils/routes/route_name.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/home_view_model.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeViewModel homeViewModel= HomeViewModel();

  Future<void> onRefresh() async{
    await homeViewModel.fetchMoviesListApi();
  }

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Movies"),
        centerTitle: true,
        actions: [
          Consumer<UserViewModel>(builder: (context, value, child){
            return InkWell(
              onTap: (){
                value.remove().then((value){
                  Navigator.pushReplacementNamed(context, RouteName.login);
                });
              },
              child: Center(child: Text("Logout", style: TextStyle(fontSize: 20),)),
            );
          }),
          SizedBox(width: 20,)
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
         child: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, child){
              switch(value.moviesList.status){
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(child: Text(value.moviesList.message.toString()));
                case Status.COMPLETE:
                  return ListView.builder(
                      itemCount: value.moviesList.data!.movies!.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(value.moviesList.data!.movies![index].posterurl.toString(),
                              ),
                            ),
                            title: Text(value.moviesList.data!.movies![index].title.toString()),
                            subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                                Icon(Icons.star, color: Colors.yellow,)
                              ],
                            ),
                          ),
                        );
                      });
                default:
                  return Container();
              }
            }),),)
    );
  }
}
