import 'package:flutter/material.dart';
import 'package:news_wave/view_model/news_view_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final NewsViewModel viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News",style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.white,
       leading:  IconButton(onPressed: (){}, icon: Image.asset(
         "assets/images/category_icon.png",height: 30,width: 30,)),
      ),
    );
  }
}
