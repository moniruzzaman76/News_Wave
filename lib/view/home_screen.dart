import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_wave/view_model/news_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final NewsViewModel viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News",style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,size: 30,)),
        ],
        backgroundColor: Colors.white,
       leading:  IconButton(onPressed: (){}, icon: Image.asset(
         "assets/images/category_icon.png",height: 30,width: 30,)),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.55,
            width: width * 0.9,
            child:FutureBuilder(
              future: viewModel.fetchNewChannelHeadLineApi(),
              builder: (context,snapshot){
               if(snapshot.connectionState == ConnectionState.waiting){
                 return const Center(
                   child: SpinKitCircle(
                     size: 50,
                     color: Colors.blue,
                   ),
                 );
               }
                 return ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: snapshot.data?.articlesList?.length,
                     itemBuilder: (context,index){
                    var newsData = snapshot.data?.articlesList![index];
                       return Stack(
                         alignment: Alignment.center,
                         children: [
                           Container(
                             padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                             height: height * 0.6,
                             width: width,
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(15),
                               child: CachedNetworkImage(
                                  imageUrl: newsData!.urlToImage.toString(),
                                 fit: BoxFit.cover,
                                 placeholder: (context, url) => Container(child: spinKit2,),
                                 errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),
                               ),
                             ),
                           ),
                           Positioned(
                             bottom: 20,
                             child: Card(
                               child: Container(
                                 padding: const EdgeInsets.all(16),
                                 height: height * 0.2,
                                 width: width * 0.9,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(16),
                                 ),
                                 child: Column(
                                   crossAxisAlignment:CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const Spacer(),
                                     Text(newsData.title ?? "Unknown",
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                       style: GoogleFonts.poppins(
                                       fontWeight: FontWeight.w600,
                                       fontSize: 16,
                                       color: Colors.black,
                                     ),),
                                     const Spacer(),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(newsData.source!.name ?? "BBC News",style: GoogleFonts.poppins(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w500,
                                           color: Colors.grey[600],
                                         ),),
                                         Text(newsData.publishedAt ?? "Jun 15,2024",style: GoogleFonts.poppins(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w500,
                                             color: Colors.grey[600]
                                         ),)
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           )
                         ],
                       );
                     }
                 );
              },
            )
          ),
        ],
      ),
    );
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);